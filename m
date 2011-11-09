From: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 2/3] staging: nvec: add device tree support
Date: Wed, 9 Nov 2011 11:57:55 -0800
Message-ID: <20111109195755.GA7052@suse.de>
References: <cover.1320173572.git.marvin24@gmx.de>
 <95b67a12e2b6ea6a9c7e17b0069ec7c9fc6f719c.1320173573.git.marvin24@gmx.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173EDABBF6@HQMAIL01.nvidia.com>
 <20111109191144.GB5354@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111109191144.GB5354-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 09, 2011 at 11:11:44AM -0800, Olof Johansson wrote:
> On Tue, Nov 01, 2011 at 03:36:31PM -0700, Stephen Warren wrote:
> > Marc Dietrich wrote at Tuesday, November 01, 2011 2:37 PM:
> > > This adds device tree support to the nvec driver. By using this method
> > > it is no longer necessary to specify platform data through a board
> > > file.
> > 
> > Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> 
> Greg, this one can go through the staging tree. We'll pick up the other pieces
> of the series through the tegra soc tree.

Ok, will do.

greg k-h
