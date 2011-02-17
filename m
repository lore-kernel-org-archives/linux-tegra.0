From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/4] usb: otg: Add ulpi viewport access ops
Date: Thu, 17 Feb 2011 10:59:46 -0800
Message-ID: <20110217185946.GA3851@kroah.com>
References: <1297895962-28590-1-git-send-email-benoit@android.com>
 <1297895962-28590-2-git-send-email-benoit@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1297895962-28590-2-git-send-email-benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 16, 2011 at 02:39:19PM -0800, Benoit Goby wrote:
> Add generic access ops for controllers with a ulpi viewport register
> (e.g. Chipidea/ARC based controllers).
> 
> Change-Id: I53d50857d4716f8df708af199ad1def1ff9d4beb

WTF is this?

I've complained about this in the past, please don't send this ever
again, as it makes NO sense for a patch that is being sent for
acceptance to the kernel source tree.

I'll wait for your resubmission before taking this series.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
