From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH V2 1/4] i2c: tegra: Add __devinit/exit to probe/remove
Date: Tue, 20 Dec 2011 13:47:29 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF176BE92E21@HQMAIL01.nvidia.com>
References: <1324189772-26914-1-git-send-email-swarren@nvidia.com>
	<20111220015634.GA27789@quad.lixom.net>
 <CAM=Q2cs8K4vraWPNqervcmxEqUGiAbng+44+L9OhD3ijPw9tAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM=Q2cs8K4vraWPNqervcmxEqUGiAbng+44+L9OhD3ijPw9tAA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shubhrajyoti Datta <omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Shubhrajyoti Datta wrote at Monday, December 19, 2011 11:15 PM:
...
> Hi Stephen ,
> could you check this one also
> thanks.
> 
> From: Shubhrajyoti D <shubhrajyoti-l0cyMroinI0@public.gmane.org>
> Date: Tue, 20 Dec 2011 11:40:51 +0530
> Subject: [PATCH] I2C : tegra : devexit in remove
> 
> Adding I2C __devexxit in remove
> 
> Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Shubhrajyoti D <shubhrajyoti-l0cyMroinI0@public.gmane.org>

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Ben or Olof,

> -       .remove  = tegra_i2c_remove,
> +       .remove  =__devexit_p(tegra_i2c_remove),

When you apply this, can you fix it up to add a space after the = in
the modified line? If you want, I can post an updated version to do that.

-- 
nvpublic
