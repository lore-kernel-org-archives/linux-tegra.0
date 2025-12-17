Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1627232ED2F
	for <linux-tegra@vger.kernel.org>; Wed, 17 Dec 2025 23:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766013500; cv=none; b=edQVKDQDO6nXSUCUD3VirNGC3FKgLaSXj0mTe8dzYEZ7U3cvzqEXOA68+fVW/nWjPt1wthyPl97jH1WFnRIKkDYIQPxTyizSpKTQ6SxiTJ03ON/iOL1JMjxQhSkBGIEDZaWdYG4Vd+qrHeioCrLZOPWehcjUGmaVtAqZKyQqOBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766013500; c=relaxed/simple;
	bh=4sJrl2AOvvkrDUgLKBqz603NEpV1KdizOUO6eH4qpMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IlilvIMkuDCCSBtQYlrt5doaf3uCfS6G1w4ACrCiIz7XUcP+M4MbqRnPuxL13HiD7B1XsxuCTmTdlbgH8946eKVxrDWKpkVDCRsPDzSDAadm+46a5i16cBZiwIbnC9oy42WUcmKKKqchk2E6w+vSlVXVxwwCAb9xFkDclvuNbuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwuFastE; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwuFastE"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6499159273dso8062780a12.3
        for <linux-tegra@vger.kernel.org>; Wed, 17 Dec 2025 15:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766013497; x=1766618297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UN96YHFRB/4inIMgi3dbMvEusx9VWtrV50KsEfyV8ik=;
        b=TwuFastEa0H8ik1XWtULzCvqpmhwAIGWObDSeUUZr4GwBDrDV7rwBinLUrGC32d1v8
         KvPlSzZsKM9i4JjFpVBPlzYzZCn0hTsaf4iPSeezi5Y690pQyC0NGzmSXnxm/qLuBN86
         nAtudhw4+wvXdr2aMN3XAP5QTcEDx3DahIFuNR3ToPDesGIJWXodEPN0+0Jz+vhvxh8B
         usrc0Cb2ZSQWaqpSxI0nWIBpTojPyt037Iosm3/AYIfyIuzZnwFAHSiKjlKnHkBsRZOx
         uIy5iYmoEsZr9FpWiDPyY0H88LBgpQ/n17dLeO9ymvkTXKeJ3OGaYUCn5TA26HJeCNre
         rqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766013497; x=1766618297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UN96YHFRB/4inIMgi3dbMvEusx9VWtrV50KsEfyV8ik=;
        b=tlaqqhuQ6YQ3QlTe5bRBB1kuCBhuo/I4XoWgCVA8VmuTPbTOgwp254dGJ9EsuZ1uV4
         9Chc/pacDjYFcWPkP0GXv4h4AX2pf8eQAmx3Dv0G0aOLQS2XFwDglmrRhD4HtYfYwGJu
         1LyLnWUGxFDZjt0KkZUWVVLpJ7rFFOuGh4gMQ/7qqw/shQCDP5vGEAF+DSeqvT8BCMlT
         odxVAjkd6V6zE2YFGKfLymZFe/Ki92IQ+xU1BPi4euRUTg2HPYh+TWu9Dvuw2RGENVof
         iGb6T2sdxWRx1/BQ03Q0D91MiI/5Efrb3bCQ7R0b7iLr6AnxgW+D1YEWXScDTnsgjAGW
         neBw==
X-Forwarded-Encrypted: i=1; AJvYcCW2s5ReNQoqvoD3te8/I+6Dt2JLWHY+wfpn4Q7vOSaxL/ObpE1qkESDZ+PgUfBAw0hf7tLuh9xYEZMuRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwx7mjOibz9DaDCpsYmUnKVCzTtECyiTc+CFw1muEk0r+BqpFd
	I+W2nIdIakvfxKDJNyvJ7hMdegE0b+6cWHEJfHvTuFAft//VD3J3dzK+
X-Gm-Gg: AY/fxX77X1OZcQyIU7M2nQvMO4OCNNB+ulXM3NAeGvixuJ4ev/mtGACapP+66ThoJET
	DAp+U84kJ0EF+9KQ0BpWjm27krQXlKSAj3sZX1QlWhmFJKIXm4CdwpLImwPNYo2/o6IOSgZH3BZ
	zRnybTHmqBK96Uv/J/y668sYiZKJ/lwERHc4Z9Q+1YxIJLpPELAtB9TrsgS58iiVFCqMsQS9Nv0
	XJ9/vwAyhQWorLJhszcfrx+LkkbmYqxkb6gtdEthTQfy8WRP8VEplrf/hIOknIhE+GVXpR3hC0u
	tubNJu7VEXY8+zUO2Ui25ZMWw/Yz16M9QJcQqo54lTNfbsB57ej6r+CqIEDhWOqP1zb1hP1znCj
	0YB5Ovv8ql5W7ifI7OgrqFmVBajdgJEyE1/QLb+aAJMF9xkq1OFg82s4fs+h5q4mMgXFg48UB/9
	3hP9NPQXXXrTwXaCs8BoSO4DQYzSU3hz+ofYFHV5C6eQuhAMSaL7h+
X-Google-Smtp-Source: AGHT+IH72LAfNzyy+q1FdHHf4lMhn1wfNHRULTFndvPYWMDbTNlqP41izrh+Mgb7nu96smLmXrV0VQ==
X-Received: by 2002:a05:6402:2681:b0:63c:4da1:9a10 with SMTP id 4fb4d7f45d1cf-6499b331141mr17431482a12.31.1766013497198;
        Wed, 17 Dec 2025 15:18:17 -0800 (PST)
Received: from [192.168.0.130] (84-148-177-143.ftth.glasoperator.nl. [143.177.148.84])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b5886d434sm760731a12.21.2025.12.17.15.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 15:18:16 -0800 (PST)
Message-ID: <6dc26bf0-6e28-4478-9ec4-20622cc8a19e@gmail.com>
Date: Thu, 18 Dec 2025 00:18:18 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
 <pedxgtvzfrfzihoshhfvntin3hwwi3znleilbz4abjad74nowb@un33lgiaa26z>
 <CALHNRZ9-XrMUkQE0cwjq-HUYsy5uerhOQ9sNpirp23kKoaPuYw@mail.gmail.com>
 <72llskwvuwyllvz24zoex4ad6v6t5skiehmwylj7exoh7bmzjo@xq3v7vja5w62>
 <CALHNRZ_k6e9ZRmpK6Pzpet=RzUQ0fRYmfnea6U+9E2oZc8=z7w@mail.gmail.com>
 <eac10a43-5164-4ecf-8b56-6099e69001bc@gmail.com>
 <CALHNRZ9b98Su9qAqXRSTCStoUPtC_u3+MG0cr4SQ-g3aVJD7LQ@mail.gmail.com>
Content-Language: en-US
From: Jasper Korten <jja2000@gmail.com>
In-Reply-To: <CALHNRZ9b98Su9qAqXRSTCStoUPtC_u3+MG0cr4SQ-g3aVJD7LQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/12/2025 05:23, Aaron Kling wrote:

> On Wed, Nov 5, 2025 at 3:28 PM Jasper Korten <jja2000@gmail.com> wrote:
>> Hi all,
>>
>> On 11/4/25 19:12, Aaron Kling wrote:
>>> On Tue, Nov 4, 2025 at 3:14 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>>>> On Mon, Nov 03, 2025 at 12:39:57PM -0600, Aaron Kling wrote:
>>>>> On Mon, Nov 3, 2025 at 5:54 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>>>>>> On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4 Relay wrote:
>>>>>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>>>>>
>>>>>>> Without the cmu, nvdisplay will display colors that are notably darker
>>>>>>> than intended. The vendor bootloader and the downstream display driver
>>>>>>> enable the cmu and sets a sRGB table. Loading that table here results in
>>>>>>> the intended colors.
>>>>>>>
>>>>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/tegra/dc.h  |  13 +++
>>>>>>>    drivers/gpu/drm/tegra/sor.c | 206 ++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>    2 files changed, 219 insertions(+)
>>>>>> What does "darker than intended" mean? Who defines the intention? How do
>>>>>> we know what the intention is? What this patch ultimately seems to be
>>>>>> doing is define sRGB to be the default colorspace. Is that always the
>>>>>> right default choice? What if people want to specify a different
>>>>>> colorspace?
>>>>> I reported this issue almost a month ago. See kernel lore [0] and
>>>>> freedesktop issue [1]. The pictures in the latter show what nvdisplay
>>>>> looks like right now. It's nigh unusably dark. When booted into
>>>>> Android with a tv launcher that has a black background, as is default
>>>>> for LineageOS, it is really hard to read anything. Is it correct as a
>>>>> default? Well, cboot hardcodes this, so... presumably? It would be
>>>>> more ideal to expose this and csc to userspace, but I'm not sure if
>>>>> drm has a standardized interface for that or if tegra would have to
>>>>> make something vendor specific. I think that would be a separate
>>>>> change concept compared to setting this default, though.
>>>> The reason I'm asking is because I don't recall ever seeing "broken"
>>>> colors like you do. So I suspect that this may also be related to what
>>>> display is connected, or the mode that we're setting.
>> I have tried it on both a MacroSilicon HDMI capture card and an Arzopa
>> Z1FC 1080p portable monitor and run into the same darker colors. Both
>> have in common that they use HDMI which seems to line up with what Aaron
>> is reporting. I do not have an eDP display to test or another carrier
>> board with a different display out to test.
>>>> It could perhaps
>>>> also be related to what infoframes we're sending and how these are
>>>> supported/interpreted by the attached display.
>>>>
>>>> All of that is to say that maybe this looks broken on the particular
>>>> setup that you have but may works fine on other setups. Changing the
>>>> default may fix your setup and break others.
>>> Do you have a device set up so you can check? Or does the regression
>>> test bench have a display that can be forwarded?
>>>
>>> My current setup is a rack of units plugged via hdmi to a kvm which is
>>> then plugged to a pikvm. I also observed this issue before I had this
>>> setup, plugged directly to a 1080p monitor. I have not checked
>>> displayport. I can cycle through a couple other displays without this
>>> patch to see if I get any other result. I am fairly certain I have
>>> consistently seen this issue since I started trying to work with
>>> tegra-drm on kernel 6.1 or maybe even 5.15. I've never seen it work to
>>> allow for a bisect.
>>>
>>> I am in contact with one other person with a tx2 devkit, who
>>> replicated the issue when I asked. Who plans to reply to this thread
>>> with setup info later.
>> For reference, I am said person. I have a Jetson TX2 Devkit that uses
>> the P2771 Device Tree. I'm running a Fedora distrokernel with no
>> additional patches applied by myself. I have personally noticed the
>> issue to at least be present on 6.14.5 and 6.17.4.
>>
>>
>> I'm currently not at home to take screenshots with and without the
>> submitted patch, but will be able to do it tomorrownight or friday.
> Any further thoughts from the maintainers on this patch? As far as I
> know, this is an issue for all users, at the very least on hdmi.
>
> Aaron

I've finally captured some footage of the colors of my TX2 within tty.
I've also added a reference in the form of my X13s doing the same thing.[1]

I will at a later date try the patch and update the MR comment,
but at least this shows the difference while recording using the same setup.

Kindest regards,

Jasper

[1]: https://gitlab.freedesktop.org/drm/tegra/-/issues/8#note_3242611

