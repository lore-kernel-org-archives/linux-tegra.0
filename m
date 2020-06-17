From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 22/37] dt-bindings: host1x: Document new interconnect
 properties
Date: Thu, 18 Jun 2020 00:48:21 +0300
Message-ID: <8fc5c06f-ee0f-f907-6631-05b45b89c7da@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
 <20200609131404.17523-23-digetx@gmail.com> <20200617213726.GA2837398@bogus>
 <5303317a-2cb6-d7a8-361a-30867fc6eab7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5303317a-2cb6-d7a8-361a-30867fc6eab7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

18.06.2020 00:44, Dmitry Osipenko пишет:
> 18.06.2020 00:37, Rob Herring пишет:
>> On Tue, Jun 09, 2020 at 04:13:49PM +0300, Dmitry Osipenko wrote:
>>> Most of Host1x devices have at least one memory client. These clients
>>> are directly connected to the memory controller. The new interconnect
>>> properties represent the memory client's connection to the memory
>>> controller.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  .../display/tegra/nvidia,tegra20-host1x.txt   | 68 +++++++++++++++++++
>>>  1 file changed, 68 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>>> index 47319214b5f6..ab4fbee7bccf 100644
>>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>>> @@ -20,6 +20,10 @@ Required properties:
>>>  - reset-names: Must include the following entries:
>>>    - host1x
>>>  
>>> +Each host1x client module having to perform DMA through the Memory Controller
>>> +should have the interconnect endpoints set to the Memory Client and External
>>> +Memory respectively.
>>> +
>>>  The host1x top-level node defines a number of children, each representing one
>>>  of the following host1x client modules:
>>>  
>>> @@ -36,6 +40,12 @@ of the following host1x client modules:
>>>    - reset-names: Must include the following entries:
>>>      - mpe
>>>  
>>> +  Optional properties:
>>> +  - interconnects: Must contain entry for the MPE memory clients.
>>> +  - interconnect-names: Must include name of the interconnect path for each
>>> +    interconnect entry. Consult TRM documentation for information about
>>> +    available memory clients, see MEMORY CONTROLLER section.
>>> +
>>>  - vi: video input
>>>  
>>>    Required properties:
>>> @@ -65,6 +75,12 @@ of the following host1x client modules:
>>>        - power-domains: Must include sor powergate node as csicil is in
>>>          SOR partition.
>>>  
>>> +  Optional properties:
>>> +  - interconnects: Must contain entry for the VI memory clients.
>>> +  - interconnect-names: Must include name of the interconnect path for each
>>> +    interconnect entry. Consult TRM documentation for information about
>>> +    available memory clients, see MEMORY CONTROLLER section.
>>> +
>>>  - epp: encoder pre-processor
>>>  
>>>    Required properties:
>>> @@ -78,6 +94,12 @@ of the following host1x client modules:
>>>    - reset-names: Must include the following entries:
>>>      - epp
>>>  
>>> +  Optional properties:
>>> +  - interconnects: Must contain entry for the EPP memory clients.
>>> +  - interconnect-names: Must include name of the interconnect path for each
>>> +    interconnect entry. Consult TRM documentation for information about
>>> +    available memory clients, see MEMORY CONTROLLER section.
>>> +
>>>  - isp: image signal processor
>>>  
>>>    Required properties:
>>> @@ -91,6 +113,12 @@ of the following host1x client modules:
>>>    - reset-names: Must include the following entries:
>>>      - isp
>>>  
>>> +  Optional properties:
>>> +  - interconnects: Must contain entry for the ISP memory clients.
>>> +  - interconnect-names: Must include name of the interconnect path for each
>>> +    interconnect entry. Consult TRM documentation for information about
>>> +    available memory clients, see MEMORY CONTROLLER section.
>>> +
>>>  - gr2d: 2D graphics engine
>>>  
>>>    Required properties:
>>> @@ -104,6 +132,12 @@ of the following host1x client modules:
>>>    - reset-names: Must include the following entries:
>>>      - 2d
>>>  
>>> +  Optional properties:
>>> +  - interconnects: Must contain entry for the GR2D memory clients.
>>> +  - interconnect-names: Must include name of the interconnect path for each
>>> +    interconnect entry. Consult TRM documentation for information about
>>> +    available memory clients, see MEMORY CONTROLLER section.
>>> +
>>>  - gr3d: 3D graphics engine
>>>  
>>>    Required properties:
>>> @@ -122,6 +156,12 @@ of the following host1x client modules:
>>>      - 3d
>>>      - 3d2 (Only required on SoCs with two 3D clocks)
>>>  
>>> +  Optional properties:
>>> +  - interconnects: Must contain entry for the GR3D memory clients.
>>> +  - interconnect-names: Must include name of the interconnect path for each
>>> +    interconnect entry. Consult TRM documentation for information about
>>> +    available memory clients, see MEMORY CONTROLLER section.
>>> +
>>>  - dc: display controller
>>>  
>>>    Required properties:
>>> @@ -149,6 +189,10 @@ of the following host1x client modules:
>>>    - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
>>>    - nvidia,edid: supplies a binary EDID blob
>>>    - nvidia,panel: phandle of a display panel
>>> +  - interconnects: Must contain entry for the DC memory clients.
>>> +  - interconnect-names: Must include name of the interconnect path for each
>>> +    interconnect entry. Consult TRM documentation for information about
>>> +    available memory clients, see MEMORY CONTROLLER section.
>>>  
>>>  - hdmi: High Definition Multimedia Interface
>>>  
>>> @@ -297,6 +341,12 @@ of the following host1x client modules:
>>>    - reset-names: Must include the following entries:
>>>      - vic
>>>  
>>> +  Optional properties:
>>> +  - interconnects: Must contain entry for the VIC memory clients.
>>> +  - interconnect-names: Must include name of the interconnect path for each
>>> +    interconnect entry. Consult TRM documentation for information about
>>> +    available memory clients, see MEMORY CONTROLLER section.
>>> +
>>>  Example:
>>>  
>>>  / {
>>> @@ -410,6 +460,15 @@ Example:
>>>  			resets = <&tegra_car 27>;
>>>  			reset-names = "dc";
>>>  
>>> +			interconnects = <&mc TEGRA20_MC_DISPLAY0A &emc>,
>>> +					<&mc TEGRA20_MC_DISPLAY0B &emc>,
>>> +					<&mc TEGRA20_MC_DISPLAY0C &emc>,
>>> +					<&mc TEGRA20_MC_DISPLAY1B &emc>;
>>
>> This looks odd or wrong. Each entry has 2 phandles? 
> 
> Each entry defines interconnect path, where MC is the start of the path
> and EMC is the end. So yes, 2 phandles for each path.
> 
> Please see arm/boot/dts/qcom-msm8974.dtsi for another example [1].
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/qcom-msm8974.dtsi?h=v5.8-rc1#n1448
> 

Actually, there are even better examples:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sc7180.dtsi?h=v5.8-rc1#n1044
