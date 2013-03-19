From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clk: add table lookup to mux
Date: Tue, 19 Mar 2013 16:51:10 -0700
Message-ID: <20130319235110.8663.67548@quantum>
References: <1363113747-6572-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363113747-6572-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Peter De Schrijver (2013-03-12 11:42:23)
> diff --git a/include/linux/clk-private.h b/include/linux/clk-private.h
> index 9c7f580..53d39c2 100644
> --- a/include/linux/clk-private.h
> +++ b/include/linux/clk-private.h
> @@ -144,12 +144,13 @@ struct clk {
>  
>  #define DEFINE_CLK_MUX(_name, _parent_names, _parents, _flags, \
>                                 _reg, _shift, _width,           \
> -                               _mux_flags, _lock)              \
> +                               _mux_flags, _table, _lock)      \
>         static struct clk _name;                                \
>         static struct clk_mux _name##_hw = {                    \
>                 .hw = {                                         \
>                         .clk = &_name,                          \
>                 },                                              \
> +               .table = _table,                                \
>                 .reg = _reg,                                    \
>                 .shift = _shift,                                \
>                 .width = _width,                                \

This breaks OMAP horribly since OMAP already uses this macro.  There are
two options:

1) stop using statically initialized data and no longer use
clk-private.h macros.  I was under the impression that the tegra clock
data no longer required this?

2) if you must continue to use the clk-private.h macros (temporarily!)
then create a new one, DEFINE_CLK_MUX_TABLE.

Regards,
Mike
