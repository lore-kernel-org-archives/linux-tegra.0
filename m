From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: comedi: fixed few coding style warnings
Date: Fri, 16 Oct 2015 23:22:43 -0700
Message-ID: <20151017062243.GA26616@kroah.com>
References: <20151014140300.GA22848@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20151014140300.GA22848@localhost.localdomain>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sakshi Bansal <sakshi.april5@gmail.com>
Cc: devel@driverdev.osuosl.org, jak@jak-linux.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 14, 2015 at 07:33:00PM +0530, Sakshi Bansal wrote:
> Fixed block comments usage of * on subsequent lines
> 
> Signed-off-by: Sakshi Bansal <sakshi.april5@gmail.com>
> ---
>  drivers/staging/comedi/comedi.h        | 181 +++++++++++++++++++--------------
>  drivers/staging/comedi/comedi_pcmcia.h |   3 +-
>  drivers/staging/comedi/comedilib.h     |  26 ++---
>  3 files changed, 120 insertions(+), 90 deletions(-)
> 
> diff --git a/drivers/staging/comedi/comedi.h b/drivers/staging/comedi/comedi.h
> index 66edda1..31a43ee 100644
> --- a/drivers/staging/comedi/comedi.h
> +++ b/drivers/staging/comedi/comedi.h
> @@ -1,20 +1,20 @@
>  /*
> -    include/comedi.h (installed as /usr/include/comedi.h)
> -    header file for comedi
> + *  include/comedi.h (installed as /usr/include/comedi.h)
> + *  header file for comedi
>  
> -    COMEDI - Linux Control and Measurement Device Interface
> -    Copyright (C) 1998-2001 David A. Schleef <ds@schleef.org>
> + *  COMEDI - Linux Control and Measurement Device Interface
> + *  Copyright (C) 1998-2001 David A. Schleef <ds@schleef.org>
>  
> -    This program is free software; you can redistribute it and/or modify
> -    it under the terms of the GNU Lesser General Public License as published by
> -    the Free Software Foundation; either version 2 of the License, or
> -    (at your option) any later version.
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU Lesser General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
>  

Why are you leaving the blank lines alone?  Either do it all or nothing,
what you are doing here is not correct at all :(

Hint, please leave these alone, there's nothing wrong with the existing
format.

sorry,

greg k-h
