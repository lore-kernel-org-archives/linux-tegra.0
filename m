From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage-configs PATCH] Add p2371-2180 BCT
Date: Thu, 10 Dec 2015 14:48:28 -0700
Message-ID: <5669F32C.3080005@wwwdotorg.org>
References: <1449594296-32493-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449594296-32493-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/08/2015 10:04 AM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> This is for the Jetson TX1 developer kit. The SDRAM timings were taken
> from the L4T r23 release.

I have applied this, although I have found a few caveats with the 
content when used with nvtboot. In particular, nvtboot appears to expect:

a) num_sdram_sets to be equal to 0. This causes the boot ROM not to 
initialize SDRAM, which then triggers nvtboot to do so. Either nvtboot 
initializes SDRAM differently than the boot ROM does even when using the 
same SDRAM parameters from the BCT, or there are other side-effects of 
running the SDRAM initialization code in nvtboot, such that skipping 
this operation causes nvtboot to fail to operate correctly. My suspicion 
so far is the latter, but more investigation is required.

b) nvtboot expects the customer_data field in the BCT to contain some 
additional data structures, e.g. board IDs.

Fixing these issues will likely only require additions to the BCT 
definition in this patch, rather than requiring anything in the patch to 
be modified/fixed. Hence it seems reasonable to apply this. cbootimage 
changes would also be required in order to set up the extra fields.
