From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] Input: tegra-kbc - add device tree bindings
Date: Tue, 27 Dec 2011 23:10:37 -0800
Message-ID: <CAOesGMg7dC8RRST7z1E3-dFD_Cr3fTwqhEP8V1NnXEiHFZvnGg@mail.gmail.com>
References: <1325053170-6984-1-git-send-email-olof@lixom.net>
	<1325053170-6984-2-git-send-email-olof@lixom.net>
	<20111228064832.GA29273@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111228064832.GA29273-WlK9ik9hQGAhIp7JRqBPierSzoNAToWh@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Tue, Dec 27, 2011 at 10:48 PM, Dmitry Torokhov
<dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Olof,
>
> On Tue, Dec 27, 2011 at 10:19:29PM -0800, Olof Johansson wrote:
>> This adds a simple device tree binding to the tegra keyboard control=
ler.
>>
>> Also, mark the default keymap as __devinitdata since it is not refer=
enced
>> after boot, and shorten the name to not have to avoid line wraps.
>
> No, let's keep the names prefixed to match the rest of the driver(s).

Sure, if you prefer.

>> +
>> + =A0 =A0 pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KER=
NEL);
>
> Error handling is missing. I also dislike devm_* facilities as it cau=
ses
> inconsistencies in the way we handle releasing of resources: some of
> them will be released automatically while others need t be released
> manually. I prefer having consistent model.

I disagree -- I think the devm allocators are an excellent invention
instead of open-coding the error handling, which tends to be error
prone and just adds special cases just like you explained below.

But, it's your subsystem and with that being said...

> Does the patch below still work for you?

=2E.. sure, if you're happy I'm happy -- it gets the work done, couldn'=
t
ask for more. No need to argue the details further. :)


-Olof
