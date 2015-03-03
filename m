From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v5 09/11] drm/tegra: Reset the SOR on probe
Date: Tue, 3 Mar 2015 16:59:26 +0900
Message-ID: <CAAVeFuKiwW=pVA_pnSsaT-GOF1gdjfC87cc_ocDut+QgTJpZ+g@mail.gmail.com>
References: <1423731078-26681-1-git-send-email-tomeu.vizoso@collabora.com>
 <1423731078-26681-10-git-send-email-tomeu.vizoso@collabora.com>
 <CAAVeFuJEWt5tzy2_oLRq_UUA__QEto2NYM_FgC4P5uNk6diOhQ@mail.gmail.com> <CAPnjgZ0FWgRymBJ2MrZtJYUp+QJj+AXr3DPoU3NbuYC6BbZrDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPnjgZ0FWgRymBJ2MrZtJYUp+QJj+AXr3DPoU3NbuYC6BbZrDw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Glass <sjg@chromium.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Dylan Reid <dgreid@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?Q?Terje_Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, David Airlie <airlied@linux.ie>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 3, 2015 at 12:46 AM, Simon Glass <sjg@chromium.org> wrote:
> Hi,
>
> On 2 March 2015 at 01:41, Alexandre Courbot <gnurou@gmail.com> wrote:
>>
>> On Thu, Feb 12, 2015 at 5:51 PM, Tomeu Vizoso
>> <tomeu.vizoso@collabora.com> wrote:
>> > As there isn't a way for the firmware on the Nyan chromebooks to hand
>> > over the display to the kernel.
>>
>> Could this have a side-effect on models for which the firmware *does*
>> hand over the display to the kernel? E.g. temporary glitch or black
>> screen?
>>
>> This is probably ok though, as such a handing over would need to be
>> documented in the firmware/kernel command line, and could thus be
>> caught to disable that code block if needed.
>
> Is there a general way in which this hand-over is done, e.g. with a
> device tree binding?

simple-framebuffer has bindings that describe a framebuffer handed
over by the firmware, and they look like the right way to describe
this. simplefb however is a framebuffer driver - a DRM driver would
need to seamlessly take over the display at some point and disable
simplefb. I don't know if this is possible at the moment.

Or maybe the DRM framework could look for a simple-framebuffer
compatible node, extract the framebuffer information, and pass it to
DRM drivers at probe time. That supposes a kernel in which
simple-framebuffer is not compiled in to prevent it from taking over
the display.
