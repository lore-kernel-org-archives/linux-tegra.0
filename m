From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra: Fix build issue due to irq_domain rework.
Date: Fri, 24 Feb 2012 16:29:42 -0700
Message-ID: <20120224232942.GL25293@ponder.secretlab.ca>
References: <1329175275-19404-1-git-send-email-swarren@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17BD8BCE0C@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BD8BCE0C-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 24, 2012 at 03:12:37PM -0800, Stephen Warren wrote:
> Stephen Warren wrote at Monday, February 13, 2012 4:21 PM:
> > Commit 7da5a66 "irq_domain: Remove 'new' irq_domain in favour of the
> > ppc one" changed the set of available irq domain APIs. Update the Tegra
> > GPIO driver to account for those changes, to solve a build break.
> 
> Grant, Linus,
> 
> Could this please be checked in; linux-next since about Feb 6th doesn't
> build for Tegra without it.

This doesn't apply against the gpio tree since I didn't pick up the DT patches.
It looks like Olof did.  (3391811c & 6f74dc9bc).  The irq_domain branch is
stable now, so it can be merged into the arm-soc tree before applying this
patch.

g.
