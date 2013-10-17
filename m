From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 00/13] ARM: tegra: Enable DSI, panel and 3D support
Date: Thu, 17 Oct 2013 11:45:51 -0600
Message-ID: <5260224F.6020509@wwwdotorg.org>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com> <52602063.30501@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52602063.30501-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/17/2013 11:37 AM, Stephen Warren wrote:
> On 10/15/2013 09:27 AM, Thierry Reding wrote:
>> This series enables DSI, HDMI and gr2d support on Dalmore as well as
>> panel support for Cardhu and Harmony. gr3d support is also enabled on
>> Tegra20 through Tegra114.
>>
>> I think I've addressed all comments from the initial version. A more
>> notable addition was that of gr3d support and a WIP patch for Tegra114
>> powergate support. I wanted to get some feedback on how to continue
>> with the powergate patch (array vs. map, see patch for details) before
>> finalizing it.
> 
> I have applied the following to Tegra's for-3.13/dt:
> 
>>   ARM: tegra: Mark Tegra30 display controller compatible with Tegra20
>>   ARM: tegra: Add host1x, DC and HDMI to Tegra114 device tree
>>   ARM: tegra: Enable HDMI support on Dalmore
>>   ARM: tegra: Use symbolic names for gr3d clocks

Actually, I just dropped the following two again:

ARM: tegra: Add host1x, DC and HDMI to Tegra114 device tree
ARM: tegra: Enable HDMI support on Dalmore

With those applied, I see a crash at boot when running Tegra's for-next
branch. Perhaps that's because the driver hasn't been updated to support
Tegra114 yet, and it would be fine once the Tegra and DRM trees were
merged, but I want the Tegra tree to be bisectable on its own.
