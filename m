From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v4 3/4] gpio/tegra: Convert to a platform device
Date: Wed, 12 Oct 2011 15:41:31 -0700
Message-ID: <20111012224131.GD25128@quad.lixom.net>
References: <1318371375-4083-1-git-send-email-swarren@nvidia.com>
 <1318371375-4083-3-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1318371375-4083-3-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 11, 2011 at 04:16:14PM -0600, Stephen Warren wrote:
> v3: Make regs variable static. Remove empty init of tegra_gpio_banks.
> 
> v2: Retrieve IRQ and memory addresses from resources instead of hard-
> coding them. Add back initialization of tegra_gpio_chip.of_node.

In the future, please move the revision log to below the ---, and just have
the main patch description above, since that is what goes into the git repo.

> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Otherwise, patch looks good. Due to dependencies between this, the rest
of this patch series and the pinmux changes, I'll hold off on it until
the dependencies land (i.e. target it for 3.3). We're cutting it very close
to the merge window as it is, I'll start for-3.3 branches shortly.


-Olof
