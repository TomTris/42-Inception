<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'getenv(MYSQL_DATABASE)' );

/** Database username */
define( 'DB_USER', 'getenv(WORDPRESS_USER1)' );

/** Database password */
define( 'DB_PASSWORD', 'getenv(WORDPRESS_USER1_PASSWORD)' );

/** Database hostname */
define( 'DB_HOST', 'getenv(WORDPRESS_DB_HOST)' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '77-)Wzov$~8h9ax&j;gc?bq/jhMn:S$8kbQ+]mEj<v3lzyOjj-.e,gU-%,+uhUxj');
define('SECURE_AUTH_KEY',  '(OSuGkOd(3HEsppr_+h(4iTV54~w+pz0Sc=2^5~=(U.dC9YNs)Fa|F~@piK8,5]k');
define('LOGGED_IN_KEY',    'vK09oD120cJ`koD)yketB4gczJWf4-*5l/7K8J5+,Vr6DW.@^V4DDi,)p[#(fVsk');
define('NONCE_KEY',        ']}6$f-7g0YmOkL)QB:d%#vR:DhuO;?EPj~YSxUpCjfOyjsZ2}#pl+#,5^$ZrNj3T');
define('AUTH_SALT',        'kdICh8oNq~+8]Fs{fHl$::^&[--(0zh-/!Y9F[`!9VWbnL/-CX(Rr6HI9xWu_X8V');
define('SECURE_AUTH_SALT', 'w$7d!Tk30aUC8>~NCLM4?Y.ctB_VHK3>9L8iO$<Dq.dq+#&#4 *stWWInwUA6nqY');
define('LOGGED_IN_SALT',   '1t]12UCV[){q_U|s~btxP!EU<V]uGG=n;)jv_O+-@|qD+^@k0$3P:JZyOL.NLf`F');
define('NONCE_SALT',       ',S*x-hruL`USbv|#C&G!Uaw9Avn@SO-jh`A?Clp!emWjL3?Vodon(H xq]]]ZD~I');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', '/var/www/html/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';