#!/bin/sh


exec python run.py \
    --exchange "$EXCHANGE" \
    --market-type "$MARKET_TYPE" \
    --symbol "$SYMBOL" \
    --spread "$SPREAD" \
    --quantity "$QUANTITY" \
    --max-orders "$MAX_ORDERS" \
    --target-position "$TARGET_POSITION" \
    --max-position "$MAX_POSITION" \
    --position-threshold "$POSITION_THRESHOLD" \
    --inventory-skew "$INVENTORY_SKEW" \
    --duration "$DURATION" \
    --interval "$INTERVAL"