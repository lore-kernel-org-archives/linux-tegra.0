From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: venice2: add GK20A GPU DT node
Date: Thu, 9 Oct 2014 17:05:44 +0900
Message-ID: <CAAVeFuLwE5L1y1syGZySB1G2XfS_-ZmNWscr01Y4jA+0d_rQKA@mail.gmail.com>
References: <1412835112-7209-1-git-send-email-acourbot@nvidia.com>
 <20141009074326.GA1010@ulmo> <54363DE8.9030102@nvidia.com> <20141009080016.GA1203@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141009080016.GA1203@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 9, 2014 at 5:00 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Oct 09, 2014 at 04:48:56PM +0900, Alexandre Courbot wrote:
>> On 10/09/2014 04:43 PM, Thierry Reding wrote:
>> >* PGP Signed by an unknown key
>> >
>> >On Thu, Oct 09, 2014 at 03:11:51PM +0900, Alexandre Courbot wrote:
>> >>From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> >>
>> >>Add the device-tree node for the GK20A GPU and leave it disabled by
>> >>default. It is the responsability of the bootloader to enable it if the
>> >>VPR registers have been programmed such as the GPU can operate.
>> >>
>> >>Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> >>Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> >>---
>> >>  arch/arm/boot/dts/tegra124-venice2.dts | 8 +++++++-
>> >>  1 file changed, 7 insertions(+), 1 deletion(-)
>> >
>> >Are you going to send the corresponding patches for U-Boot to update
>> >the status property if it's initialized VPR?
>>
>> Yes. But maybe I should wait until upstream Nouveau actually works properly
>> for that? Right now it will probe successfully, but will crash as soon as
>> the GPU is used because there still are memory coherency problems.
>
> I think the same really goes for these patches. Applying these will make
> the node available to U-Boot, so technically some future U-Boot version
> could modify a kernel DTB and boot a version where nouveau didn't yet
> work out-of-the-box.
>
> There's also still the issue about firmware loading and so on, so maybe
> holding off on applying these patches until gk20a is fully enabled is a
> good idea. Normally I guess this would be done by not adding the kernel
> driver until it's expected to be at least usable to some degree, but I
> guess it is a bit late for that now.

I'm fine with that too. Dropping these patches fow now.
