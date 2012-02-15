From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c: tegra: Remove unnecessary clk_get
Date: Thu, 16 Feb 2012 00:17:00 +0530
Message-ID: <4F3BFDA4.2000802@nvidia.com>
References: <1328314217-16632-1-git-send-email-swarren@nvidia.com>	<4F2D1400.5050907@nvidia.com>	<74CDBE0F657A3D45AFBB94109FB122FF178E5D3162@HQMAIL01.nvidia.com> <CAPnjgZ2r1+tSiiKg0rHH_atrLVqn6h+7ueMdtcmaRYtkdXiTRw@mail.gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF178FACB8BA@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178FACB8BA-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday 16 February 2012 12:13 AM, Stephen Warren wrote:
>
> This appears to apply to modules lfsr, dsi, csi, i2c1/2/3, uart1/2/3/4/5,
> but apparently not the DVC I2C controller according to the TRM. Laxman,
> can you confirm that the DVC I2C controller doesn't take a clock from
> pll_p_out3?
>

DVC i2C is also require this 2nd clock.

> P.S. this patch I posted is in our downstream 2.6.39 and 3.1 kernels.
> Given this thread, I assume it should be reverted there...
>

Yes, I have pushed the change in our downstream tree K3.1 and it is 
under testing/promotion..
