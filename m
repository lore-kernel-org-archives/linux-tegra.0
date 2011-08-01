From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] i2c: tegra: Fix compile when !CONFIG_OF
Date: Sun, 31 Jul 2011 21:05:56 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF049EEAAE27@HQMAIL01.nvidia.com>
References: <1310589418-15821-1-git-send-email-swarren@nvidia.com>
 <CACxGe6sVmpSTAxan3zRz-hQ=uoiVuekm-7r0L9_F5EWPPhS_3A@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF049EBDF141@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049EBDF141-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren wrote at Thursday, July 21, 2011 9:42 AM:
> Grant Likely wrote at Wednesday, July 13, 2011 4:48 PM:
> > On Thu, Jul 14, 2011 at 5:36 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > > When !CONFIG_OF, <linux/of.h> doesn't prototype of_get_property(), which
> > > causes i2c-tegra.c to fail to compile. Make the references to this
> > > function conditional to solve this.
> > >
> > > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ...
> > Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> 
> Ben, please can this patch be applied in time for 3.1? Currently, the
> linux-next and next-i2c tree won't compile on Tegra without CONFIG_OF
> enabled.

Ben, can this patch please be pushed for 3.1 to solve the compile problem?

> Also, the other patch I posted titled "i2c: Tegra: Add of_match_table"
> is required for Tegra I2C Device Tree support to be useful. Can that go
> into 3.1 as well?

Ben, can this patch please go into 3.1, since it's logically a missing
part of a patch that's already in 3.1, but got applied too early?

Thanks.

--
nvpublic
