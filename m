From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: tegra: Remove use of TEGRA_GPIO_TO_IRQ
Date: Tue, 24 Jan 2012 00:34:13 -0800
Message-ID: <20120124083413.GA14484@quad.lixom.net>
References: <1325702378-20863-1-git-send-email-swarren@nvidia.com>
 <20120104195218.GF15503@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120104195218.GF15503-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Wed, Jan 04, 2012 at 12:52:18PM -0700, Grant Likely wrote:
> On Wed, Jan 04, 2012 at 11:39:33AM -0700, Stephen Warren wrote:
> > Replace compile-time usage of TEGRA_GPIO_TO_IRQ with run-time calls to
> > gpio_to_irq(). This will allow the base IRQ number for the Tegra GPIO
> > driver to be dynamically allocated in a later patch.
> > 
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> For the whole series:
> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>


Thanks, applied 1-6 to tegra for-3.4 (version 2 of patch 6).


-Olof
