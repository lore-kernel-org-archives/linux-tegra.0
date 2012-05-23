From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: Re: [PATCH 1/2] ASoC: tegra+alc5632: move all GPIO setup into probe
Date: Wed, 23 May 2012 09:00:11 +0300
Message-ID: <CALq1K=KZfp48oVHMD7A5RK==-CKet0yOmu-kkPS4XW-R0+noTw@mail.gmail.com>
References: <1337724592-12434-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337724592-12434-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, May 23, 2012 at 1:09 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>=
 wrote:
>
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Now that deferred probe exists, we can parse device tree and request
> GPIOs from probe(), rather than deferring this to the DAI link's init=
().
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
Thanks.



--
Leon Romanovsky | Independent Linux Consultant
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0www.leon.nu=C2=A0| leon-2ukJVAZIZ/Y@public.gmane.org
