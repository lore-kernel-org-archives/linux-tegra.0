From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM: tegra: Add MIPI calibration DT entries for Tegra114
Date: Tue, 08 Oct 2013 10:17:27 -0600
Message-ID: <52543017.9030501@wwwdotorg.org>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com> <1381146528-18069-4-git-send-email-treding@nvidia.com> <5253249B.6010008@wwwdotorg.org> <20131008100529.GE19633@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131008100529.GE19633-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/08/2013 04:05 AM, Thierry Reding wrote:
> On Mon, Oct 07, 2013 at 03:16:11PM -0600, Stephen Warren wrote:
>> On 10/07/2013 05:48 AM, Thierry Reding wrote:
>>> Add a device node for the MIPI calibration block on Tegra114.
>>> There is no need to disable it by default because it only
>>> enables the clock while performing calibration and therefore
>>> shouldn't be consuming any power when unused.
>> 
>>> include/dt-bindings/gpu/host1x/tegra114-mipi.h | 11
>>> +++++++++++
>> 
>> Shouldn't that file be added in the same patch that defines the
>> binding that header contains constants for? What are those
>> constants anyway?
> 
> I'm not sure. The values themselves are not used within the driver.
> They are merely a convenience for DTS authors.
> 
> In a nutshell, the values defined within that file are a bitmask of
> the pads that need calibration. There are 9 pads (5 for CSI, 4 for
> DSI) but the association to each input/output isn't immediately
> obvious. One DSI output uses DSIA and DSIB pads, while the other
> uses DSIC and DSID.

Ah. For values that are useful when creating *.dts, but not actually
part of a binding definition, I'd tend to #define them a header file
or *.dtsi in the dts/ directory, rather than the dt-bindings/
directory. The whole point of dt-bindings/ was for constants that both
*.dts and the driver need to share.

> Perhaps in this case it isn't useful to introduce the header at all
> and just using the numerical values would be fine?

It's probably useful to name them, although a comment in the final
*.dts would likely be fine too.
