From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] ARM: tegra: Re-add removed SoC id macro to tegra_resume()
Date: Fri, 10 Oct 2014 02:10:03 +0400
Message-ID: <543707BB.1040603@gmail.com>
References: <20141008190432.GN22688@saruman> <1412796255-10589-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412796255-10589-1-git-send-email-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

08.10.2014 23:24, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Commit d127e9c5c5bc1ee22a7b1fe804397cddd132f756 ("ARM: tegra: make te=
gra_resume
> can work with current and later chips") removed tegra_get_soc_id macr=
o leaving
> used cpu register unassigned and as result causing execution of unint=
ended code
> on tegra20. Fix it by re-adding macro.
>=20
> Fixes: d127e9c (ARM: tegra: make tegra_resume can work with current a=
nd later chips)
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v3.13+
> Reviewed-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> V2: added Cc's for lakml and stable, added "Reviewed-by:" Felipe Balb=
i
>=20
>  arch/arm/mach-tegra/reset-handler.S | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/mach-tegra/reset-handler.S b/arch/arm/mach-tegr=
a/reset-handler.S
> index 7b2baab..71be4af 100644
> --- a/arch/arm/mach-tegra/reset-handler.S
> +++ b/arch/arm/mach-tegra/reset-handler.S
> @@ -51,6 +51,7 @@ ENTRY(tegra_resume)
>   THUMB(	it	ne )
>  	bne	cpu_resume			@ no
> =20
> +	tegra_get_soc_id TEGRA_APB_MISC_BASE, r6
>  	/* Are we on Tegra20? */
>  	cmp	r6, #TEGRA20
>  	beq	1f				@ Yes
>=20
Ugh, I just noticed that r6 is expected to be SoC id func argument. It =
was bug
in my emulator that blinded me, so please drop that patch.
But, seems tegra20_lp1_reset() doesn't set r6, at least for now I don't=
 see
where. I'll check it on real hw and send patch if needed.

--=20
Dmitry
