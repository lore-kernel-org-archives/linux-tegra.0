From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Fix MLOCK's debug info
Date: Mon, 7 Sep 2015 12:22:45 +0300
Message-ID: <55ED5765.6080807@gmail.com>
References: <1435519624-16444-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435519624-16444-1-git-send-email-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?Q?Terje_Bergstr=c3=b6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

28.06.2015 22:27, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> MLOCK's debug info, spewed on CDMA timeout, contains meaningless MLOC=
K
> owner channel ID because HOST1X_SYNC_MLOCK_OWNER_CHID_F() returns shi=
fted
> value, while unshifted should be used. Fix it by changing '_F' to '_V=
'.
>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   drivers/gpu/host1x/hw/debug_hw.c         | 2 +-
>   drivers/gpu/host1x/hw/hw_host1x01_sync.h | 8 ++++----
>   drivers/gpu/host1x/hw/hw_host1x02_sync.h | 8 ++++----
>   drivers/gpu/host1x/hw/hw_host1x04_sync.h | 8 ++++----
>   4 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/host1x/hw/debug_hw.c b/drivers/gpu/host1x/hw=
/debug_hw.c
> index 791de93..cc3f182 100644
> --- a/drivers/gpu/host1x/hw/debug_hw.c
> +++ b/drivers/gpu/host1x/hw/debug_hw.c
> @@ -298,7 +298,7 @@ static void host1x_debug_show_mlocks(struct host1=
x *host, struct output *o)
>   			host1x_sync_readl(host, HOST1X_SYNC_MLOCK_OWNER(i));
>   		if (HOST1X_SYNC_MLOCK_OWNER_CH_OWNS_V(owner))
>   			host1x_debug_output(o, "%d: locked by channel %d\n",
> -				i, HOST1X_SYNC_MLOCK_OWNER_CHID_F(owner));
> +				i, HOST1X_SYNC_MLOCK_OWNER_CHID_V(owner));
>   		else if (HOST1X_SYNC_MLOCK_OWNER_CPU_OWNS_V(owner))
>   			host1x_debug_output(o, "%d: locked by cpu\n", i);
>   		else
> diff --git a/drivers/gpu/host1x/hw/hw_host1x01_sync.h b/drivers/gpu/h=
ost1x/hw/hw_host1x01_sync.h
> index ac704e5..31238c2 100644
> --- a/drivers/gpu/host1x/hw/hw_host1x01_sync.h
> +++ b/drivers/gpu/host1x/hw/hw_host1x01_sync.h
> @@ -131,12 +131,12 @@ static inline u32 host1x_sync_mlock_owner_r(uns=
igned int id)
>   }
>   #define HOST1X_SYNC_MLOCK_OWNER(id) \
>   	host1x_sync_mlock_owner_r(id)
> -static inline u32 host1x_sync_mlock_owner_chid_f(u32 v)
> +static inline u32 host1x_sync_mlock_owner_chid_v(u32 v)
>   {
> -	return (v & 0xf) << 8;
> +	return (v >> 8) & 0xf;
>   }
> -#define HOST1X_SYNC_MLOCK_OWNER_CHID_F(v) \
> -	host1x_sync_mlock_owner_chid_f(v)
> +#define HOST1X_SYNC_MLOCK_OWNER_CHID_V(v) \
> +	host1x_sync_mlock_owner_chid_v(v)
>   static inline u32 host1x_sync_mlock_owner_cpu_owns_v(u32 r)
>   {
>   	return (r >> 1) & 0x1;
> diff --git a/drivers/gpu/host1x/hw/hw_host1x02_sync.h b/drivers/gpu/h=
ost1x/hw/hw_host1x02_sync.h
> index 4495401..540c7b6 100644
> --- a/drivers/gpu/host1x/hw/hw_host1x02_sync.h
> +++ b/drivers/gpu/host1x/hw/hw_host1x02_sync.h
> @@ -131,12 +131,12 @@ static inline u32 host1x_sync_mlock_owner_r(uns=
igned int id)
>   }
>   #define HOST1X_SYNC_MLOCK_OWNER(id) \
>   	host1x_sync_mlock_owner_r(id)
> -static inline u32 host1x_sync_mlock_owner_chid_f(u32 v)
> +static inline u32 host1x_sync_mlock_owner_chid_v(u32 v)
>   {
> -	return (v & 0xf) << 8;
> +	return (v >> 8) & 0xf;
>   }
> -#define HOST1X_SYNC_MLOCK_OWNER_CHID_F(v) \
> -	host1x_sync_mlock_owner_chid_f(v)
> +#define HOST1X_SYNC_MLOCK_OWNER_CHID_V(v) \
> +	host1x_sync_mlock_owner_chid_v(v)
>   static inline u32 host1x_sync_mlock_owner_cpu_owns_v(u32 r)
>   {
>   	return (r >> 1) & 0x1;
> diff --git a/drivers/gpu/host1x/hw/hw_host1x04_sync.h b/drivers/gpu/h=
ost1x/hw/hw_host1x04_sync.h
> index ef2275b..3d6c8ec 100644
> --- a/drivers/gpu/host1x/hw/hw_host1x04_sync.h
> +++ b/drivers/gpu/host1x/hw/hw_host1x04_sync.h
> @@ -131,12 +131,12 @@ static inline u32 host1x_sync_mlock_owner_r(uns=
igned int id)
>   }
>   #define HOST1X_SYNC_MLOCK_OWNER(id) \
>   	host1x_sync_mlock_owner_r(id)
> -static inline u32 host1x_sync_mlock_owner_chid_f(u32 v)
> +static inline u32 host1x_sync_mlock_owner_chid_v(u32 v)
>   {
> -	return (v & 0xf) << 8;
> +	return (v >> 8) & 0xf;
>   }
> -#define HOST1X_SYNC_MLOCK_OWNER_CHID_F(v) \
> -	host1x_sync_mlock_owner_chid_f(v)
> +#define HOST1X_SYNC_MLOCK_OWNER_CHID_V(v) \
> +	host1x_sync_mlock_owner_chid_v(v)
>   static inline u32 host1x_sync_mlock_owner_cpu_owns_v(u32 r)
>   {
>   	return (r >> 1) & 0x1;
>
Ping Thierry

--=20
Dmitry
