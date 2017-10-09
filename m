From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [Outreachy kernel] Re: [PATCH v2] drm/tegra: Replace dev_* with DRM_DEV_*
Date: Mon, 9 Oct 2017 15:00:56 -0400
Message-ID: <CAOw6vb+YrGO=09bPzsX9aFtFKpQntadwT43dh4sL6KUwdH+f0A@mail.gmail.com>
References: <1506271437-23058-1-git-send-email-harshasharmaiitr@gmail.com> <20170925073841.GA12494@ulmo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170925073841.GA12494-m5CkvRiFyV9wFLYp8hBm2A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Harsha Sharma <harshasharmaiitr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, outreachy-kernel <outreachy-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 25, 2017 at 3:38 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sun, Sep 24, 2017 at 10:13:57PM +0530, Harsha Sharma wrote:
>> Replace all occurences of dev_info/err/dbg with DRM_DEV_INFO/
>> ERROR/DEBUG as we have DRM_DEV_* variants of drm print macros
>> Done using following coccinelle semantic patch
>>
>> @r@
>> @@
>>
>> (
>> -dev_info
>> +DRM_DEV_INFO
>> |
>> -dev_err
>> +DRM_DEV_ERROR
>> |
>> -dev_dbg
>> +DRM_DEV_DEBUG
>> )
>>
>> Signed-off-by: Harsha Sharma <harshasharmaiitr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> Changes in v2:
>>  -Break line over 80 characters
>>  -Changes in comments not required
>
> Please don't do this. Most of the functions that you're trying to
> replace here are not DRM_DEV_*() for a very specific reason: none of
> them have anything to do with DRM/KMS in particular. This is important,
> in my opinion, because these messages are very device-specific and the
> additional information added by the DRM format string aren't useful in
> the context.

Hey Thierry,
It's likely not useful to a tegra expert such as yourself. However,
when I'm switching between platforms or providing log-parsing
instructions, it's very useful to say "grep for drm". Without the
common drm prefix, the reader needs to know they're looking for
tegra-sor, tegra-dc, etc as well.

Not a big deal, I just wanted to provide color for why someone might want this.

>
> Perhaps the only ones I consider to be good candidates for this
> conversion are the ones in drivers/gpu/drm/tegra/fb.c because they deal
> with the DRM fbdev setup and hence are not device specific. And even in
> those cases I'm not sure we gain very much by this conversion,
> especially since most of the replacements now end up having to split up
> argument lists.
>
> Sorry if this isn't documented anywhere. I also suspect other driver
> maintainers will be less picky about this sort of thing, so you might
> have more luck there.

I think the TODO entry states that contributors should check with the
driver maintainers before taking on this work, so it is documented :)

Sean


>
> Thierry
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> To post to this group, send email to outreachy-kernel-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/20170925073841.GA12494%40ulmo.fritz.box.
> For more options, visit https://groups.google.com/d/optout.
