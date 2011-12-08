From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 4/5] arm/dt: tegra: Fix serial nodes to match board files
Date: Wed, 7 Dec 2011 16:21:18 -0800
Message-ID: <20111208002118.GJ12945@quad.lixom.net>
References: <1321911851-10091-1-git-send-email-swarren@nvidia.com>
 <1321911851-10091-4-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1321911851-10091-4-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 21, 2011 at 02:44:10PM -0700, Stephen Warren wrote:
> Mark any serial ports that aren't registered by the board files as disabled
> in the device-tree files.
> 
> In practice, none of the now-disabled ports ended up succeeding device
> probing because of the missing clock-frequency property. However,
> explicitly marking the devices disabled has the advantage of squashing
> the dev_warn() the failed probe causes, and documenting that we intend
> the port not to be used, rather than accidentally left out the property.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks, applied to for-3.3/boards


-Olof
