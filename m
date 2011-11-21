From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Re: [PATCH 2/3] staging: nvec: add device tree support
Date: Mon, 21 Nov 2011 14:42:34 +0100
Message-ID: <2139252.qPrj5UdCGj@fb07-iapwap2>
References: <cover.1320173572.git.marvin24@gmx.de> <20111109191144.GB5354@quad.lixom.net> <20111109195755.GA7052@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111109195755.GA7052-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, 9. November 2011, 11:57:55 schrieb Greg KH:
> On Wed, Nov 09, 2011 at 11:11:44AM -0800, Olof Johansson wrote:
> > On Tue, Nov 01, 2011 at 03:36:31PM -0700, Stephen Warren wrote:
> > > Marc Dietrich wrote at Tuesday, November 01, 2011 2:37 PM:
> > > > This adds device tree support to the nvec driver. By using this method
> > > > it is no longer necessary to specify platform data through a board
> > > > file.
> > > 
> > > Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> > 
> > Greg, this one can go through the staging tree. We'll pick up the other pieces
> > of the series through the tegra soc tree.
> 
> Ok, will do.
> 
> greg k-h

Ping.

Greg, it seems that this patch is still not in staging. Please apply 
http://patchwork.ozlabs.org/patch/123140/

Thanks

Marc
