From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Wed, 27 Jun 2012 11:49:43 -0600
Message-ID: <4FEB47B7.4080104@wwwdotorg.org>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de> <4FE9FB22.1090902@wwwdotorg.org> <20120626195108.GB5308@avionic-0098.adnet.avionic-design.de> <4FEA3C2E.3030109@wwwdotorg.org> <20120627050733.GA7177@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120627050733.GA7177-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/26/2012 11:07 PM, Thierry Reding wrote:
> On Tue, Jun 26, 2012 at 04:48:14PM -0600, Stephen Warren wrote:
...
> I actually like what you proposed above a lot, so if you don't
> mind either way I'll go with that proposal. Keeping the connector
> nodes as children of the outputs has the advantage of being able to
> reference them if we need it at some point. But it is also
> redundant in that a single output doesn't usually (never?) driver
> more than one connector.

Yes, I believe that each output is 1:1 with (the video portion of) a
connector. The display controllers obviously aren't 1:1.

> The same issue will have to be addressed for the CSI and VI nodes,
> but as I currently use neither of those I don't feel qualified to
> propose a binding for them. Also for the VI part we're completely
> missing documentation. Maybe somebody could push this to be
> released as well?

I did file a bug noting the request for VI documentation. At this
point in time, it's too early to say what, if anything, will come of that.

> If I understand correctly, most of the host1x children can also be 
> chained in a processing pipeline to do postprocessing an video
> input for example. I suppose that's generic and doesn't need to be
> represented in DT either, right?

Yes, I believe that's something internal to the driver.
