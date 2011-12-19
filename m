From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH V2 1/4] i2c: tegra: Add __devinit/exit to probe/remove
Date: Mon, 19 Dec 2011 08:59:44 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF176BE929ED@HQMAIL01.nvidia.com>
References: <1324189772-26914-1-git-send-email-swarren@nvidia.com>
 <CAM=Q2csGoQR8PZhQO_oeVZt9CqEq377Ut8swY5g12M_=71on9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM=Q2csGoQR8PZhQO_oeVZt9CqEq377Ut8swY5g12M_=71on9g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shubhrajyoti Datta <omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Shubhrajyoti Datta wrote at Sunday, December 18, 2011 11:54 PM:
> On Sun, Dec 18, 2011 at 11:59 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > This fixes some section mismatch build warnings.
>
> What was the error was a devinit function called from these?

As I Understand It, probe/remove are devinit/exit functions, and hence
should be marked as such.

The errors were from building with CONFIG_DEBUG_SECTION_MISMATCH=y.

I guess the section mismatch errors won't actually show up in the code
that's in the kernel right now; they only showed up because I had a local
patch that modified probe() to reference tegra_i2c_of_match[] which is
__devinitconst. I since reworked that patch so that it doesn't introduce
that reference, for other reasons. Still, I think this is a good cleanup
change even if nothing is actually causing these mismatch errors to fire
right now.

-- 
nvpublic
