From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] dt: rfkill-gpio: add bindings documentation
Date: Mon, 13 Feb 2012 07:47:28 -0600
Message-ID: <4F391470.3090102@gmail.com>
References: <1ec0e63a7453072689618430ebc2bdd7b62542a2.1329073559.git.marvin24@gmx.de> <86044d44009316a48b402050f9dd742391d46eac.1329073559.git.marvin24@gmx.de> <CAPnjgZ2b4QjKMKjKyHqGGU1TbMamq6pBPUAAO99gMa98Rd+Erw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ2b4QjKMKjKyHqGGU1TbMamq6pBPUAAO99gMa98Rd+Erw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/12/2012 02:21 PM, Simon Glass wrote:
> Hi Marc,
> 
> On Sun, Feb 12, 2012 at 11:13 AM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
>> Add device tree bindings information for rfkill gpio switches.
>>
>> Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
>> Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
>> Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/gpio/rfkill.txt |   38 +++++++++++++++++++++
>>  1 files changed, 38 insertions(+), 0 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/rfkill.txt
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/rfkill.txt b/Documentation/devicetree/bindings/gpio/rfkill.txt
>> new file mode 100644
>> index 0000000..22bf22a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/rfkill.txt
>> @@ -0,0 +1,38 @@
>> +RFKILL switches connected to GPIO lines
>> +
>> +Required properties:
>> +- compatible : should be "rfkill-gpio".
>> +
>> +Each rfkill switch is represented as a sub-node of the rfkill-gpio device.
>> +Each node has a label property which represents the name of the corresponding
>> +rfkill device.
>> +
>> +RFKILL sub-node properties:
>> +- label :  (optional) The label for this rfkill switch.  If omitted, the label is
>> +  taken from the node name (excluding the unit address).
>> +- reset-gpio, shutdown-gpio :  Should specify the rfkill gpios for reset and
>> +  shutdown (see "Specifying GPIO information for devices" in
> 
> Should that be reset-gpios, shutdown-gpios? Even though you have only
> one it seems that people put an 's' on the end.
> 
>> +  Documentation/devicetree/booting-without-of.txt).
>> +- type : enumerated type of the gpio (see include/linux/rfkill.h).
> 
> It would be better I think if this were explicit here. If you have a
> number, then what values does it take and what do they mean?
> 
>> +- clock : (optional) name of the clock name associated with the rfkill switch
> 
> Can this be a phandle instead of a string?
> 

This seems to be in the wrong place altogether. The gpio controller
would have a clock, not particular gpio line.

>> +  (see include/linux/rfkill-gpio.h)
> 
> IMO device tree bindings should be fully documented in this file,
> rather than needing to look at a separate header. This is particularly
> true if the binding is used in another project.
> 

Correct. A binding should not be Linux specific. It should describe the h/w.

>> +
>> +Examples:
>> +
>> +rfkill-switches {
>> +       compatible = "rfkill-gpio";
>> +
>> +       wifi {
>> +               label = "wifi";
>> +               reset-gpio = <&gpio 25 0>; /* Active high */
>> +               shutdown-gpio = <&gpio 85 0>; /* Active high */
>> +               type = <1>;
>> +       };
>> +
>> +       bt {
>> +               label = "bluetooth";
>> +               reset-gpio = <&gpio 17 0>; /* Active high */
>> +               shutdown-gpio = <&gpio 35 0>; /* Active high */
>> +               type = <1>;
>> +       };

Why wouldn't the gpio lines just be part of the bt and wifi device nodes
themselves? The DT is supposed to describe h/w connections.

Rob

>> +};
>> --
>> 1.7.5.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> Regards,
> Simon
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
