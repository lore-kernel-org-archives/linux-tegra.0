From: Mirza Krak <mirza.krak@gmail.com>
Subject: Re: [PATCH v2 3/6] dt/bindings: Add bindings for Tegra GMI controller
Date: Wed, 24 Aug 2016 21:54:47 +0200
Message-ID: <CALw8SCVcPymDZ8NyUbeanRF0TCT1TZzL6iRDticYA42FWrEWqw@mail.gmail.com>
References: <1472045838-22628-1-git-send-email-mirza.krak@gmail.com>
 <1472045838-22628-4-git-send-email-mirza.krak@gmail.com>
 <de2fb909-829e-6c04-4f6a-442cbb9171c9@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <de2fb909-829e-6c04-4f6a-442cbb9171c9@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: mark.rutland@arm.com, Alexandre Courbot <gnurou@gmail.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, linux-clk@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, pdeschrijver@nvidia.com, sboyd@codeaurora.org, linux@armlinux.org.uk, robh+dt@kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

2016-08-24 17:56 GMT+02:00 Jon Hunter <jonathanh@nvidia.com>:
+
>> +Example with two SJA1000 CAN controllers connected to the GMI bus. We wrap the
>> +controllers with a simple-bus node since they are all connected to the same
>> +chip-select (CS4), in this example external address decoding is provided:
>> +
>> +gmi@70090000 {
>> +     compatible = "nvidia,tegra20-gmi";
>> +     reg = <0x70009000 0x1000>;
>> +     #address-cells = <1>;
>> +     #size-cells = <1>;
>> +     clocks = <&tegra_car TEGRA20_CLK_NOR>;
>> +     clock-names = "gmi";
>> +     resets = <&tegra_car 42>;
>> +     reset-names = "gmi";
>> +     ranges = <4 0x48000000 0x7ffffff>;
>> +
>> +     status = "disabled";
>> +
>> +     bus@4 {
>> +             compatible = "simple-bus";
>> +             reg = <4>;
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>> +             ranges = <0 4 0x40100>;
>
> Does this work? I tried to add an example like this and I got ...
>
> Warning (reg_format): "reg" property in /gmi@70009000/bus@4 has invalid
> length (4 bytes) (#address-cells == 1, #size-cells == 1)

Shoot, to get rid of the warning it should be

reg = <4 0 >;

But it works either way.

>
> I am wondering if we should just following the arm,pl172 example and
> have ...
>
>         cs4 {
>                 compatible = "simple-bus";
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>                 ranges;
>
>                 nvidia,snor-cs = <4>;
>                 nvidia,snor-mux-mode;
>                 nvidia,snor-adv-inv;
>
>                 can@0 {
>                         reg = <0 0x100>;
>                         ...
>                 };
>
>                 ...
>         };
>

That means to go back to V1 really (almost :)). Which I do not mind.
Will give it a test run.

But I am a little hesitant if will be any better/cleaner. In your example above:

can@0 {
         reg = <0 0x100>;
         ...
};

Would this really translate correctly? In the pl172 example they have
multiple ranges and address with "flash@0,0" which a range defined in
parent node. "can@0" does not have valid match in parent node in our
example. So I probably need add some more logic for it to properly
translate.

I have an idea which is following:

gmi@70090000 {
         status = "okay";
         #address-cells = <2>;
         #size-cells = <1>;
         ranges = <4 0 0x48000000 0x00040000>;

         cs4 {
                 compatible = "simple-bus";
                 #address-cells = <2>;
                 #size-cells = <1>;
                 ranges;

                 nvidia,snor-cs = <4>;
                 nvidia,snor-mux-mode;
                 nvidia,snor-adv-inv;

                 can@0 {
                         compatible = "nxp,sja1000";
                         reg = <4 0 0x100>;
                         ...
                 };


                 can@40000 {
                         compatible = "nxp,sja1000";
                         reg = <4 0x40000 0x100>;
                         ...
                 };
         };
};

Do not know if above will work at all (not able to test at current
location), anyway I will play around with it some more and get back to
you.

Best Regards
Mirza
