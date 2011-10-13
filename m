From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] i2c: tegra: __iomem annotation fix
Date: Thu, 13 Oct 2011 09:33:01 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A088@HQMAIL01.nvidia.com>
References: <1318465980-625-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318465980-625-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Wednesday, October 12, 2011 6:33 PM:
> drivers/i2c/busses/i2c-tegra.c:585:7: warning: incorrect type in assignment (different address spaces)
> drivers/i2c/busses/i2c-tegra.c:585:7:    expected void *base
> drivers/i2c/busses/i2c-tegra.c:585:7:    got void [noderef] <asn:2>*
> drivers/i2c/busses/i2c-tegra.c:619:16: warning: incorrect type in assignment (different address
> spaces)
> drivers/i2c/busses/i2c-tegra.c:619:16:    expected void [noderef] <asn:2>*base
> drivers/i2c/busses/i2c-tegra.c:619:16:    got void *base
> drivers/i2c/busses/i2c-tegra.c:689:10: warning: incorrect type in argument 1 (different address
> spaces)
> drivers/i2c/busses/i2c-tegra.c:689:10:    expected void volatile [noderef] <asn:2>*addr
> drivers/i2c/busses/i2c-tegra.c:689:10:    got void *base
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-- 
nvpublic
