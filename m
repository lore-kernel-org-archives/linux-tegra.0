From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: rebuild tegra_defconfig
Date: Fri, 06 Dec 2013 10:43:39 -0700
Message-ID: <52A20CCB.20802@wwwdotorg.org>
References: <1386196073-25193-1-git-send-email-swarren@wwwdotorg.org> <20131206152225.GF32372@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131206152225.GF32372-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/06/2013 08:22 AM, Thierry Reding wrote:
> On Wed, Dec 04, 2013 at 03:27:52PM -0700, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> 
>> This separates out "NULL" changes from future real changes.
>> 
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> --- 
>> arch/arm/configs/tegra_defconfig | 12 ++++-------- 1 file
>> changed, 4 insertions(+), 8 deletions(-)
> 
> Not sure if this makes sense for what's essentially a
> machine-generated change, but I've at least verified that this
> doesn't drop anything unwanted, so:

Well, the purpose was to make the real change in patch 2/2 obvious, so
it was easier to review. defconfig changes all get squashed back
together when applied.
