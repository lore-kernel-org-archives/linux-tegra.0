From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] dt: add empty of_get_property for non-dt
Date: Mon, 8 Aug 2011 12:26:04 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF049F172239@HQMAIL01.nvidia.com>
References: <1312584630-23371-1-git-send-email-swarren@nvidia.com>
 <4E3EA340.2010100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E3EA340.2010100-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Axel Lin <axel.lin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Rob Herring wrote at Sunday, August 07, 2011 8:38 AM:
> On 08/05/2011 05:50 PM, Stephen Warren wrote:
> > The patch adds empty function of_get_property for non-dt build, so that
> > drivers migrating to dt can save some '#ifdef CONFIG_OF'.
> >
> > This also fixes the current Tegra compile problem in linux-next.
>
> You could just use of_property_read_u32 in the driver. It already has
> empty version and will simplify the driver code some.

Yes, that would also work.

Grant, Ben, do you have a preference for which option to choose?

Thanks.

> > diff --git a/include/linux/of.h b/include/linux/of.h
...
> > +static inline const void *of_get_property(const struct device_node *node,
> > +				const char *name,
> > +				int *lenp)
> > +{
> > +	return NULL;
> > +}
> > +

-- 
nvpublic
