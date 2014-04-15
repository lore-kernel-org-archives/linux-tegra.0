From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH V3 0/7] Re-enable jtag function for Tegra124
Date: Tue, 15 Apr 2014 12:16:15 -0600
Message-ID: <534D776F.2000601@wwwdotorg.org>
References: <1397209843-31275-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397209843-31275-1-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/11/2014 03:50 AM, Penny Chiu wrote:
> This patch series is used to update BCT configs to re-enable jtag function
> for Tegra124.
> 
> Since the secure jtag is disabled by default once SECURITY_MODE fuse is
> blown. BOOTROM will re-enable secure jtag function if BCT has
> SecureJTAGControl=1 and a matching chip UID included.
> 
> After applying these changes, cbootimage can access jtag control and chip uid
> fields. It can also read the BCT data from pre-built image, update the BCT
> configs based on config file, and generate a new image file.

Thanks for the revisions. I have applied the whole series, and pushed it
to github.

Do you need a tagged release created?
