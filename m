From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/2] staging: Introduce NVIDIA Tegra20 video decoder
 driver
Date: Tue, 26 Sep 2017 02:45:23 +0300
Message-ID: <d19d709b-7451-0cdc-8bd0-913dc9c0a27d@gmail.com>
References: <cover.1506377430.git.digetx@gmail.com>
 <5c8b83775b982e6ee851c127444a8e839f422ad0.1506377430.git.digetx@gmail.com>
 <38daee0d-0595-a7e4-69bb-5a2ddbd832b5@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <38daee0d-0595-a7e4-69bb-5a2ddbd832b5@wwwdotorg.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 26.09.2017 02:01, Stephen Warren wrote:
> On 09/25/2017 04:15 PM, Dmitry Osipenko wrote:
>> Video decoder, found on NVIDIA Tegra20 SoC, supports a standard set of
>> video formats like H.264 / MPEG-4 / WMV / VC1. Currently driver supports
>> decoding of CAVLC H.264 only.
> 
> Note: I don't know anything much about video decoding on Tegra (just NV desktop
> GPUs, and that was a while ago), but I had a couple small comments on the DT
> binding:
> 
>> diff --git
>> a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-vde.txt
>> b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-vde.txt
> 
>> +NVIDIA Tegra Video Decoder Engine
>> +
>> +Required properties:
>> +- compatible : "nvidia,tegra20-vde"
>> +- reg : Must contain 2 register ranges: registers and IRAM area.
>> +- reg-names : Must include the following entries:
>> +  - regs
>> +  - iram
> 
> I think the IRAM region needs more explanation: What is the region used for and
> by what? Can it be moved, and if so does the move need to be co-ordinated with
> any other piece of SW?
> 

IRAM region is used by Video Decoder HW for internal use and some of decoding
parameters are supplied via IRAM, like frames order list. AFAIK IRAM addresses
are hardwired in HW and aren't movable, it is not 100% but I'm pretty sure.
Should it be explained in the binding?

>> +- clocks : Must contain one entry, for the module clock.
>> +  See ../clocks/clock-bindings.txt for details.
>> +- resets : Must contain an entry for each entry in reset-names.
>> +  See ../reset/reset.txt for details.
>> +- reset-names : Must include the following entries:
>> +  - vde
> 
> Let's require a clock-names property too.

Okay, I'll add this property to the binding.

-- 
Dmitry
