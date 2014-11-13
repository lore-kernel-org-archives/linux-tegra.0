From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PATCH v4 05/13] of: Document timings subnode of nvidia,tegra-mc
Date: Thu, 13 Nov 2014 10:33:43 +0100
Message-ID: <CAAObsKDqTa8ozgeXryPdw-uU-VBnp5w5=xojBHO=0Nryd_W6cw@mail.gmail.com>
References: <1415779051-26410-1-git-send-email-tomeu.vizoso@collabora.com>
 <1415779051-26410-6-git-send-email-tomeu.vizoso@collabora.com> <20141112142202.GB26488@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141112142202.GB26488@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Mikko Perttunen <mikko.perttunen@kapsi.fi>, Alexandre Courbot <acourbot@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 12 November 2014 15:22, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Wed, Nov 12, 2014 at 08:56:28AM +0100, Tomeu Vizoso wrote:
> [...]
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-mc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-mc.txt
> [...]
>> +Example board file:
>> +
>> +/ {
>> +     memory-controller@0,70019000 {
>> +             emc-timings-3 {
>> +                     nvidia,ram-code = <3>;
>
> I guess the alternative would be to keep the old names and simply use
> the reg property instead of nvidia,ram-code to be compliant with best
> practices in DT:
>
>                 emc-timings@3 {
>                         reg = <3>;
>
>> +
>> +                     timing-12750000 {
>> +                             clock-frequency = <12750000>;
>
> And:
>
>                         timing@12750000 {
>                                 reg = <12750000>;
>
> But I haven't been following this series too closely so far, so maybe
> that had already been rejected.

It has been mentioned already, but I think nobody has shown any strong
opinions on it. I personally like how it is now as it matches how it's
already done for display-timings.

Regards,

Tomeu

> Thierry
