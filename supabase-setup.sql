-- Создание таблиц для NEURAL_ARCHITECT_PREMIUM++

-- Таблица пользователей
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Таблица проработок
CREATE TABLE IF NOT EXISTS proorabotki (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    product_type TEXT,
    geometry JSONB,
    thermal JSONB,
    vacuum JSONB,
    injection JSONB,
    metrics JSONB,
    sensory JSONB,
    predicted JSONB,
    status TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Индексы для быстрого поиска
CREATE INDEX IF NOT EXISTS idx_proorabotki_user_id ON proorabotki(user_id);
CREATE INDEX IF NOT EXISTS idx_proorabotki_created_at ON proorabotki(created_at DESC);

-- Включение Row Level Security (RLS)
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE proorabotki ENABLE ROW LEVEL SECURITY;

-- Политика безопасности: пользователи могут видеть только свои данные
CREATE POLICY "Users can view their own data" ON proorabotki
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own data" ON proorabotki
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own data" ON proorabotki
    FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own data" ON proorabotki
    FOR DELETE USING (auth.uid() = user_id);