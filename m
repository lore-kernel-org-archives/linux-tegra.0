From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: tegra20: Separate out clk ops and clk data
Date: Thu, 28 Jun 2012 11:37:35 -0600
Message-ID: <4FEC965F.4060104@wwwdotorg.org>
References: <1340879846-12900-1-git-send-email-pgaikwad@nvidia.com> <1340879846-12900-3-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340879846-12900-3-git-send-email-pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: mturquette-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/28/2012 04:37 AM, Prashant Gaikwad wrote:
> Move clock initialization data to separate file. This is
> required for migrating to generic clock framework if static
> initialization is used.
> 
> TODO: Add clock suspend/resume support

Is the suspend/resume code something that was present in the existing
Tegra clock code? If not, I'd be tempted to just drop that TODO line
from the patch description when applying this.
