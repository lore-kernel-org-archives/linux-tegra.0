From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC] binding for nvec mfd device
Date: Tue, 24 Sep 2013 11:04:20 -0600
Message-ID: <5241C614.7030304@wwwdotorg.org>
References: <1416005.VvfEeGuSWa@ax5200p> <17687182.lGWlO75r41@fb07-iapwap2.physik.uni-giessen.de> <5238CE1C.3050107@wwwdotorg.org> <2112732.zfJtNyCk0i@fb07-iapwap2.physik.uni-giessen.de> <52406E1E.5040005@wwwdotorg.org> <CAMRQQz-ri99PcK5=-Rzw-fmLoyvzxbd1whUWdqASx1Pi+2GNnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMRQQz-ri99PcK5=-Rzw-fmLoyvzxbd1whUWdqASx1Pi+2GNnQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/24/2013 01:19 AM, Andrey Danin wrote:
> On Mon, Sep 23, 2013 at 8:36 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
...
>     I think you'd just have the following
> 
>     /* master */
>     i2c@xxxxx {
>         foo@0x40 {
>             reg = <MASTER 0x40>;
>             compatible = "nvidia,nvec";
>         }
>     };
> 
>     i2c@yyyy {
>         foo@40 {
>             reg = <SLAVE 0x40>;
>             compatible = "nvidia,nvec-slave";
>         }
>     };
> 
>     There's no need for the slave child node to know that it is mastered
>     from the Tegra I2C controller; all it cares about is that there is some
>     I2C bus that it needs to respond to transactions upon.
> 
> This binding describes only case, when I2C device are connected to I2C
> controller.
> 
> Assume that I2C controller #1 (@xxxxx), I2C controller #2 (@yyyy), and
> nvec I2C master device are connected to same bus.
> How dt must be composed in this case ? Must i2c@xxxxx and i2c@yyyy be in
> parent/child relation (in terms of dt) ?

None of the I2C bindings currently allow one to specify that multiple of
the on-SoC controllers are connected to the same bus.

I'm not sure it's particularly useful to represent this anyway. Hardware
hooked up like this is pretty rare to start with (i.e. I know of no
board at all that's connected this way). I assume that if such HW did
exist, you'd simply assign each I2C slave to a particular I2C master,
and hence only put a DT node for it under a single DT master node.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
