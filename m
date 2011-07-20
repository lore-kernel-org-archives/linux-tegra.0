From: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/3 v2] usb: tegra20-ehci: Add devicetree support.
Date: Wed, 20 Jul 2011 13:16:08 -0700
Message-ID: <643E69AA4436674C8F39DCC2C05F76383CF0DD2277@HQMAIL03.nvidia.com>
References: <1311190690-18334-1-git-send-email-achew@nvidia.com>
 <CACxGe6uDVdemjbjY_i-_M_-VT8HuLdtXP-R9V8kB+pSSin4dEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6uDVdemjbjY_i-_M_-VT8HuLdtXP-R9V8kB+pSSin4dEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Grant Likely' <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Willemsen <dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Venkat Moganty <vmoganty-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> Can the driver use sane defaults for any of these values?  This patch
> will be a lot smaller if there isn't the need to check all the return
> values each time.

The defaults are in the dt ehci node.  I'd really hate to duplicate these defaults in C code as well, if that's what you're suggesting (they're already duplicated privately elsewhere, sadly, in mach-tegra, but I'm hoping those defaults can go away once we move over to dt for good).  By failing probe if these defaults aren't present, I think it helps make sure the dt ehci node stays in sync with the code.

Or am I misunderstanding your comment?--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
