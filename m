From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: fix compilation error for linux 3.2
Date: Wed, 12 Oct 2011 20:48:15 -0700
Message-ID: <20111013034815.GA6047@quad.lixom.net>
References: <3546151.Ds9gZv0JqE@fb07-iapwap2>
 <CAOesGMgyYebNw1vphaKf8SPLBvtSvwPa0nCLxr81UJ-BtSRhzA@mail.gmail.com>
 <2109696.pnkA82QAhR@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2109696.pnkA82QAhR@fb07-iapwap2>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 11, 2011 at 10:28:23AM +0200, Marc Dietrich wrote:
> Hi Olof,
> 
> Am Montag, 10. Oktober 2011, 10:45:48 schrieb Olof Johansson:
> > I can't reproduce this problem. CONFIG_SPI doesn't seem to be on for
> > tegra_defconfig (I'll revisit the defconfig and turn on missing
> > options for 3.2), but even after I enable it (plus CONFIG_SPI_TEGRA),
> > I don't see any errors here. I tried static build as well as module.
> > Can you provide more detail to what you're seeing?
> 
> ah, sorry, it is needed for linux-next (which also happens to have a 3.1-rc9 
> version). You can easily check if include/linux/device.h has module.h included or not 
> (if not, tegra-spi fails to compile). I updated the subject.

Ok, makes sense. I don't see any relevant direct changes to the driver; it
seems that some of the include files used to pull in module.h and no longer
does.

Grant Likely is SPI maintainer, so it should go to him. Based on the commit
message comments, please resend a new version (and cc linux-tegra please).

> > > Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

Feel free to add:

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>



-Olof
