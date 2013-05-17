From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 3/8] ARM: tegra: update device trees for USB binding
 rework
Date: Fri, 17 May 2013 16:06:22 -0600
Message-ID: <5196A9DE.5080700@wwwdotorg.org>
References: <1368713582-29038-1-git-send-email-vbyravarasu@nvidia.com> <1368713582-29038-4-git-send-email-vbyravarasu@nvidia.com> <51956574.5070206@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51956574.5070206-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/16/2013 05:02 PM, Stephen Warren wrote:
> On 05/16/2013 08:12 AM, Venu Byravarasu wrote:
>> This patch updates all Tegra board files so that they contain all the
>> properties required by the updated USB DT binding. Note that this patch
>> only adds the new properties and does not yet remove the old properties,
>> in order to maintain bisectability. The old properties will be removed
>> once the driver has been updated to assume the new bindings.
> 
> This series looks almost OK now. The one remaining issue is that in this
> patch, the regulator-name properties don't match the schematics, and in
> the Whistler patch below, both regulators you added have the same
> regulator-name, which causes problems.
> 
> To fix this, when I apply this patch, I'm going to fold in the patch
> I'll paste below.
> 
> Right now, I can't get Whistler to see the SD card. This is true even
> without your patches. Once I've resolved that and tested Whistler,
> assuming no more problems, I'll apply patches 1-3 to the Tegra tree, and
> set up a branch that can be pulled into the USB tree so the rest of the
> series can be applied there.

I've made Whistler boot by reverting a few commits entirely unrelated to
USB or your patch series. I'll investigate those later, but for not your
patches test out fine on Whistler. So, I'll apply patches 1-3 in the
series and set up the pull request for the USB tree. Thanks.
