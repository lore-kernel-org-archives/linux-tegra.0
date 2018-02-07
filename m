From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 01/11] regulator: core: add API to get voltage
 constraints
Date: Wed, 7 Feb 2018 14:37:51 +0200
Message-ID: <20180207123750.GA5850@tbergstrom-lnx.Nvidia.com>
References: <1517934852-23255-1-git-send-email-pdeschrijver@nvidia.com>
 <1517934852-23255-2-git-send-email-pdeschrijver@nvidia.com>
 <20180206163544.GI5681@sirena.org.uk>
 <20180207084744.GG7031@tbergstrom-lnx.Nvidia.com>
 <20180207104351.GA6003@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180207104351.GA6003-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 07, 2018 at 10:43:51AM +0000, Mark Brown wrote:
> On Wed, Feb 07, 2018 at 10:47:44AM +0200, Peter De Schrijver wrote:
> > On Tue, Feb 06, 2018 at 04:35:44PM +0000, Mark Brown wrote:
> > > On Tue, Feb 06, 2018 at 06:34:02PM +0200, Peter De Schrijver wrote:
> 
> > > > Add API to get min/max rail voltage configured from platform for
> > > > given rails.
> 
> > > because...
> 
> > of the next patch where this is used to retrieve the minimum rail voltage.
> 
> And that in turn is needed for...?

To calculate the required voltage for each frequency.

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
