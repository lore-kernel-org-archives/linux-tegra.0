From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] dma: tegra: make tegra_dma.chip_data a pointer to
 const data
Date: Mon, 10 Sep 2012 12:21:09 -0600
Message-ID: <504E2F95.6040808@wwwdotorg.org>
References: <20120829084911.GE28643@pengutronix.de> <1346230295-15898-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1346230295-15898-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, djbw-b10kYP2dOMg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/29/2012 02:51 AM, Uwe Kleine-K=C3=B6nig wrote:
> From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This prepares *of_device_id.data becoming const. Without this change
> the following warning would occur:
>=20
> 	drivers/dma/tegra20-apb-dma.c: In function 'tegra_dma_probe':
> 	drivers/dma/tegra20-apb-dma.c:1210:9: warning: assignment discards '=
const' qualifier from pointer target type [enabled by default]
>=20
> [ukl: split Laxman's patch to prevent warnings in the middle of the
> series. Original patch was sent with msgid
> 1346217447-19730-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org]
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Acked-by: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Uwe,

I don't see these patches in linux-next, so compilation is still broken=
=2E
Can you please apply them? Thanks.
