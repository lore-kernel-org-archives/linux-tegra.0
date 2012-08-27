From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: add const to of_device_id.data's structure
Date: Sun, 26 Aug 2012 21:25:26 -0700
Message-ID: <503AF6B6.1010808@nvidia.com>
References: <1345976063-24437-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1345976063-24437-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?VXdlIEtsZWluZS1Lw7Zu?= =?UTF-8?B?aWc=?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/26/2012 03:14 AM, Laxman Dewangan wrote:
> The membe "data" of structure of_device_id is changed to const
> pointer. Hence initializing this with const type data.
> This will fix the compilation warning like
> drivers/dma/tegra20-apb-dma.c:1217:9: warning: assignment discards 'c=
onst' qualifier from
> pointer target type [enabled by default]
>=20
> This warning came after the change
> ---------
> commit 98d7bbb9929bcc14e11ac8a55245a4f2dc174e17
> Author: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>     of: add const to struct *of_device_id.data
> ---------

Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

I wonder if this should go through Uwe's branch that made similar
changes for all other drivers though? Uwe now CC'd.
