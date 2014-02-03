From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 00/16] drm/nouveau: initial support for GK20A (Tegra K1)
Date: Mon, 3 Feb 2014 11:44:36 +0900
Message-ID: <52EF0294.2090103@nvidia.com>
References: <1391224618-3794-1-git-send-email-acourbot@nvidia.com> <CAKb7Uvg4Bqy1tHetVZBe=aekFDbgrGygc-evnSXxsoGqgoTA8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKb7Uvg4Bqy1tHetVZBe=aekFDbgrGygc-evnSXxsoGqgoTA8A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/03/2014 04:10 AM, Ilia Mirkin wrote:
> Hi Alexandre,
>
> On Fri, Jan 31, 2014 at 10:16 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> I guess my email address might surprise some of you, so let me anticipate some
>> questions you might have. :P Yes, this work is endorsed by NVIDIA. Several other
>> NVIDIAns (CC'd), including core GPU experts, have provided significant technical
>> guidance and will continue their involvement. Special thanks go to Terje
>> Bergstrom and Ken Adams for their invaluable GPU expertise, and Thierry Reding
>> (at FOSDEM this weekend) for help with debugging and user-space testing.
>>
>> Let me also stress that although very exciting, this effort is still
>> experimental, so I would like to make sure that nobody makes excessive
>> expectations based on these few patches. The scope of this work is strictly
>> limited to Tegra (although given the similarities desktop GPU support will
>> certainly benefit from it indirectly), and we do not have any plan to work on
>> user-space support. So do not uninstall that proprietary driver just yet. ;)
>>
>> With this being clarified, we are looking forward to getting your feedback and
>> working with you guys to bring and improve Tegra K1 support into Nouveau! :)
>
> I've sent a couple of fairly trivial comments, as you saw, and I
> suspect that others with a better understanding of the guts will have
> more substantial architectural feedback, esp after the weekend/FOSDEM.
> However, since no one's said it already -- welcome to Nouveau!

Thanks! ^_^v

One beginner question: is it appropriate to send kernel patches to the 
nouveau list in addition to dri-devel? The moderation messages I receive 
make me think that this list might rather be intended for general 
discussion.

>  From the looks of it, you could bring up a full open-source stack with
> your patches (i.e. Xorg + nouveau DDX + mesa) and use PRIME to render
> stuff (assuming the actual display hw has an X ddx).  Although I
> suspect that you're going to want to use your own drivers. Still a
> little curious if you've tried the open-source stack and whether it
> worked. [Not sure what the status is of render-node support is in
> mesa, but perhaps it's enough to try running piglit tests, if you
> can't get X going with the display HW.]

We are still testing things at libdrm level, but are eventually 
interested in bringing up the existing open-source stack. Our guess (and 
hope) is that it will work nicely almost as-is, minus the fact that the 
display hardware is not handled by Nouveau and we only support render 
nodes (I have yet to look at what the state of render nodes in Mesa is).

For X, Thierry is IIUC working on the display driver, and at some point 
these efforts should join to connect tegradrm and Nouveau using PRIME. 
We are not quite there yet, and since we are working with limited 
resources it will likely require some time, but the fact we could bring 
up a (seemingly) working Nouveau kernel driver with so little code is 
encouraging.

Thanks,
Alex.
