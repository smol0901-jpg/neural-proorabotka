# NEURAL_ARCHITECT_PREMIUM++ — Система Проработок

## 🧠 Описание

Полноценная онлайн-программа для планирования, симуляции и анализа кулинарных процессов с физико-химическим ядром на молекулярном уровне.

## ✨ Возможности

- **Физико-химическое ядро**: расчеты на молекулярном уровне (диффузия, теплопроводность, испарение)
- **Симуляция в реальном времени**: "живой синхрон" как "биение сердца"
- **База данных Supabase**: сохранение всех проработок
- **Личный кабинет**: авторизация и защита паролем
- **10+ показателей**: вакуум, маринование, жарка, инъекция, ужарка, вкус, корочка, сочность и др.
- **Визуализация**: графики, прогресс-бары, анимации

## 📊 Метрики

1. Ужарка (прогнозируемая)
2. Время процесса
3. Вкус (0-10)
4. Корочка (0-10)
5. Сочность (0-10)
6. Инъекция (%)
7. Влажность
8. Температура
9. Давление вакуума
10. Толщина продукта
11. Масса
12. Количество маринада

## 🚀 Установка

1. Создайте проект на [Supabase](https://supabase.com)
2. Создайте таблицы:
   - `users` (id, username, password, created_at)
   - `proorabotki` (id, user_id, product_type, geometry, thermal, vacuum, injection, metrics, sensory, predicted, status, created_at)
3. Замените `YOUR_SUPABASE_URL` и `YOUR_SUPABASE_ANON_KEY` в `index.html`
4. Загрузите `index.html` на любой хостинг (Netlify, Vercel, GitHub Pages)

## 🔧 Настройка Supabase

### Таблица users
```sql
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### Таблица proorabotki
```sql
CREATE TABLE proorabotki (
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
```

## 📝 Автор

NEURAL_ARCHITECT_PREMIUM++
Контакты: @ASV_prod, https://vk.com/smolyaninovchef