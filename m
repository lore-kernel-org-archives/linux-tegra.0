From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 0/2] i2c: tegra: add some new features for tegra i2c
Date: Wed, 4 May 2011 11:03:41 +0800
Message-ID: <6B4D417B830BC44B8026029FD256F7F1C2CB3DD4E6@HKMAIL01.nvidia.com>
References: <1303301312-15302-1-git-send-email-wni@nvidia.com>
 <6B4D417B830BC44B8026029FD256F7F1C2CB3DD4DB@HKMAIL01.nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF0497F1AAC4@HQMAIL01.nvidia.com>
 <6B4D417B830BC44B8026029FD256F7F1C2CB3DD4E2@HKMAIL01.nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF0497F1AEEF@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0497F1AEEF-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org" <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi, Stephen
I think if doesn't need to apply the slave address codes, we can use your patch.

Thanks
Wei.

-----Original Message-----
From: Stephen Warren 
Sent: Friday, April 29, 2011 11:20 PM
To: Wei Ni
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org; ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org; lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org; ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org; linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)
Subject: RE: [PATCH 0/2] i2c: tegra: add some new features for tegra i2c

Wei Ni wrote at Friday, April 29, 2011 12:08 AM:
> Stephen Warren wrote at Thursday, April 28, 2011 12:29 AM:
> > 
> > Wei Ni wrote at Wednesday, April 27, 2011 4:26 AM:
> > > Hi, all
> > > Could anyone review these changes?
> > 
> > Wei,
> > 
> > It looks like some of the patches I recently posted address the same
> > issues as the patches you had already posted. Sorry for the potential
> > conflicts.
>
> Hi, Stephen
> I think your patches address the different issues with my patches.
> My patches are used for retry transfer and new slave controller.

Wei, aren't the following two patches basically the same thing,
except that yours also sets the slave address register, and is a bit
more wordy:

http://www.spinics.net/lists/linux-i2c/msg05464.html
http://www.spinics.net/lists/linux-i2c/msg05437.html

Upon further inspection, I don't think any of the other patches I
posted conflict with the other patch you posted.

> > Can you please take a look at the patches I posted and comment on which
> > of those are still relevant given your patches. Even for the cases where
> > we both posted patches to address the same issue (e.g. use new slave
> > mode), there are differences in the patches. I simply took the changes
> > from the chromeos-2.6.37 kernel and cherry-picked them into the mainline
> > kernel. Are the changes you posted re-written to address issues that
> > weren't solved in the ChromeOS kernel?
> > 
> > Thanks for any feedback on this.

Wei Ni wrote at Wednesday, April 20, 2011 8:09 PM:
> From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> *** BLURB HERE ***
>
> Wei Ni (2):
>   i2c: tegra: Retry transfer when unexpected/no_ack status is detected
>   i2c: tegra: use new i2c slave controller
>
>  drivers/i2c/busses/i2c-tegra.c |   57 +++++++++++++++++++++++++++++++++++++--
>  include/linux/i2c-tegra.h      |    3 ++
>  2 files changed, 57 insertions(+), 3 deletions(-)

-- 
nvpublic
