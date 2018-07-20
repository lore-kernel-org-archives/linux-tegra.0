From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 5/7] dt-bindings: Add Tegra PMC pad configuration
 bindings
Date: Fri, 20 Jul 2018 12:16:04 +0100
Message-ID: <cb67ced4-eef8-abb5-5706-3282a55edbb2@nvidia.com>
References: <1531396813-6581-1-git-send-email-avienamo@nvidia.com>
 <1531396813-6581-6-git-send-email-avienamo@nvidia.com>
 <20180716154309.GA16477@rob-hp-laptop>
 <20180717152318.3608e3f9@dhcp-10-21-25-168>
 <CAL_JsqL1F0RF_6=ho0pa7Uh4AUsyvFRDGM50gN4=6_+MwBfGYQ@mail.gmail.com>
 <20180717183020.5ab9bfa6@dhcp-10-21-25-168>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180717183020.5ab9bfa6@dhcp-10-21-25-168>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Aapo Vienamo <avienamo@nvidia.com>, Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Adding Linus ...

On 17/07/18 16:30, Aapo Vienamo wrote:

...

>>>>> +Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt.
>>>>> +
>>>>> +The values accepted by power-source property are
>>>>> +TEGRA_IO_PAD_VOLTAGE_1V8 and TEGRA_IO_PAD_VOLTAGE_3V3, which are defined
>>>>> +in dt-bindings/pinctrl/pinctrl-tegra-io-pad.h.  
>>>>
>>>> You need to list out what properties the child nodes can have.
>>>>
>>>> power-source needs a vendor prefix.  
>>>
>>> Isn't it a generic pinctrl property?  
>>
>> I don't know offhand. Doesn't look like it if you have custom values.
> 
> It's listed under "Supported generic properties" in
> pinctrl-bindings.txt. The convention seems to be not to add a vendor
> prefix even though such custom macro values are used. The property is
> currently used by qcom,pmic-gpio, qcom,pmic-mpp, and renesas,pfc-pinctrl.
> I could not find a bindings document describing it with a vendor prefix.
Looking at other users of the 'power-source' property it is not clear to
me if the values should/can be vendor specific or not. I see cases where
some people use definitions and others use actual voltages. 

Linus, any recommendations here?

Cheers
Jon	

-- 
nvpublic
