From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/5] ARM: tegra: paz00: updates for "for-next"
Date: Tue, 9 Aug 2011 12:35:29 -0700
Message-ID: <20110809193529.GA4278@quad.lixom.net>
References: <cover.1312735430.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.1312735430.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Aug 07, 2011 at 09:00:50PM +0200, Marc Dietrich wrote:
> Colin,
> 
> this is an update to the patches I send on July 15th. There are now five patches
> which add the second serial port (some solder points on the mainboard) and Wifi
> support (rfkill and LED) to PAZ00. Additionally, usb support is improved and
> the SDHCI init order is changed.
> 
> Please queue them up for "for-next" after positive review of course.

I've applied 1-3 and 5 to boards-for-3.2. Repost patch 4 standalone on next
spin. :)


Thanks,

-Olof
