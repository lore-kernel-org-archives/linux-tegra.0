From: Billy laws <blaws05@gmail.com>
Subject: Re: [PATCH v2 4/4] mfd: max77620: add documentation for low battery monitoring
Date: Thu, 31 Jan 2019 21:37:46 +0000
Message-ID: <D4E89A2D-2372-4328-92BD-5B1CF923951D@gmail.com>
References: <20190129085531.32364-1-markz@nvidia.com> <20190129085531.32364-5-markz@nvidia.com> <20190130195355.GA1652@bogus> <a6cd5f7c-d8a5-3f93-b1cf-4da3e4760dff@nvidia.com> <CAL_JsqK6z2NbJeRB48S-kmDrHj5B8H6hciR04+_Tzq4_V2jH_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqK6z2NbJeRB48S-kmDrHj5B8H6hciR04+_Tzq4_V2jH_Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Mark Zhang <markz@nvidia.com>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 31 January 2019 21:05:46 GMT, Rob Herring <robh@kernel=2Eorg> wrote:
>On Wed, Jan 30, 2019 at 8:29 PM Mark Zhang <markz@nvidia=2Ecom> wrote:
>>
>> On 1/31/2019 3:53 AM, Rob Herring wrote:
>> > On Tue, Jan 29, 2019 at 04:55:31PM +0800, Mark Zhang wrote:
>> >> Adding documentation for low battery monitor properties:
>> >> - maxim,low-battery-dac-enable
>> >> - maxim,low-battery-dac-disable
>> >> - maxim,low-battery-shutdown-enable
>> >> - maxim,low-battery-shutdown-disable
>> >> - maxim,low-battery-reset-enable
>> >> - maxim,low-battery-reset-disable
>> >>
>> >> Signed-off-by: Mark Zhang <markz@nvidia=2Ecom>
>> >> ---
>> >>  Documentation/devicetree/bindings/mfd/max77620=2Etxt | 14
>++++++++++++++
>> >>  1 file changed, 14 insertions(+)
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/mfd/max77620=2Etxt
>b/Documentation/devicetree/bindings/mfd/max77620=2Etxt
>> >> index 484b17e4fba5=2E=2E5fed0a463b80 100644
>> >> --- a/Documentation/devicetree/bindings/mfd/max77620=2Etxt
>> >> +++ b/Documentation/devicetree/bindings/mfd/max77620=2Etxt
>> >> @@ -142,6 +142,20 @@ Optional properties:
>> >>                      Device supports 100/1000/3000/6000 Ohms=2E
>> >>                      Default will be set to 1000 Ohm=2E
>> >>
>> >> +Low-Battery Monitor:
>> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >> +This sub-node configure low battery monitor configuration
>registers=2E Device has
>> >> +support for low-battery monitor configuration through child DT
>node
>> >> +"low-battery-monitor"=2E
>
>Missed this the first time, but there's not really any reason for
>these to be in a child node=2E
>
>> >> +
>> >> +Optional properties:
>> >> +    - maxim,low-battery-dac-enable: Enable low battery DAC=2E
>> >> +    - maxim,low-battery-dac-disable: Disable low battery DAC=2E
>> >> +    - maxim,low-battery-shutdown-enable: Enable low battery
>shutdown=2E
>> >> +    - maxim,low-battery-shutdown-disable: Disable low battery
>shutdown=2E
>> >> +    - maxim,low-battery-reset-enable: Enable low battery reset=2E
>> >> +    - maxim,low-battery-reset-disable: Disable low battery reset=2E
>> >
>> > Do you really need 3 states with the 3rd being prop not present=2E
>>
>> Yeah, so I think we can just keep 3 of them and shorten the names a
>little bit
>> (lbm stands for "low battery monitoring"):
>> - maxim,lbm-dac-enable
>> - maxim,lbm-shutdown-enable
>> - maxim,lbm-reset-enable
>>
>> Does this look good to you?
>
>Yes=2E However, are these 3 mutually exclusive? If so, then perhaps
>'maxim,low-battery-mode =3D "<dac|shutdown|reset>"'?
I agree, would also allow the addition of the voltage cut off point config=
uration by just adding more defines=2E(current forces 3=2Esomething v cutof=
f)
>
>Rob
