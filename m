Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121FC86347
	for <linux-tegra@vger.kernel.org>; Sun, 21 Dec 2025 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766333722; cv=none; b=kl2GlFCFvCHskRoYoTHPg1XM3bP+pdFiZw9bd975m7UoYXfdKS+7zf3Lxht0WT+40ZQQtd55FIdpLvjztA/OnAFq/5tT691s5Gnipsg7GWRVDrt6dfA4K/0lZlIEubmiEuewTC4vjMsDzDCXLHNOgk523r33E+/i55q24H/aUwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766333722; c=relaxed/simple;
	bh=qhloK+LwUSImSYheEtQjy2zxkDTztv9dexkAgQTUPkM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VkrpWslvfYN4HhvCc/Cr2oc36nxm2cEChtfrmw02/y9s6ItNgNsVi1ecxA/jZlXUWlyMbF/2GArmnibvzKidjdhVTYhZ7XIJKyrdQvW+z1bMU2mAYbrAr2/bv+y3J4UDZYgxR+8DEGcAsufDIzO0vcmdTMsMtPxVtZLxDC4n3+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mqr9wVsu; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mqr9wVsu"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b76b5afdf04so468432866b.1
        for <linux-tegra@vger.kernel.org>; Sun, 21 Dec 2025 08:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766333718; x=1766938518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A/nQPRHVIECDNB9CfoD4rf6v1tTxliW0fJjghmJAo3I=;
        b=Mqr9wVsuEQP0jGjIdYE2V+zNRaBuNyNka+H99aE4epsr2q1xXqo1g6kyVa7kquYGZ3
         Ki9aOKbJsCEmS7sUddySelmWdd6cSGqTi1iOHfHV8ZptriiCgaiwjqnAfDCvNyhbSG+n
         7TvudnspFRiu442pKkw5vzSt1Nq1D/HHcLcCO0Y857kOA71U6DPYYfhzVikWBr0gv+K+
         fLGjGDBJO+bLgAtIbquMpqk54nHHHCGrHMYCsowhAVmp6GA7M5HJnbDwQdENv+AxqNI0
         K6SvBGks5NTcTI40cYb9LEPkuNwbMYP4BWldQGMZtLrroDbGNz2QxS2UAKwnCAZVDt3j
         FWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766333718; x=1766938518;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A/nQPRHVIECDNB9CfoD4rf6v1tTxliW0fJjghmJAo3I=;
        b=idF2f9KhYBjN4Mk4AKSKqo3bxlgCENfZV2X8+Qrap3pzSQ8OQRLl52vjkSQ30y+SEp
         k0QpgPd7dE/y4BYBJBXu+4iAiQX0kgWIdAyaQOyODn4lIEnnQQDYbPQiTlfbwPUT3jKn
         b2CB3tj3tEwGm6CvdtcYpczJWESNzPao69h0copPYxB8PzVfo88kb3F2WVN13nZXJuM2
         eN3JcfWrVpocXJoroiW0P3T5s294RZ98L44Ah+tsoydgcxb0rR18DBQndHxHjdFJzNts
         LV1yC8LVjABPqSZmlySsfDOQZdTdpKUJx1prLFUWebxmDW8Fs5yFKQ0DQshQadsZXHV2
         b9/w==
X-Forwarded-Encrypted: i=1; AJvYcCVnKKGTIKAp2ZaA7oU0vZray1UdDGwsKFyD+Dzsvl2XYLhWnI+wUGS1d3zIm1vWA1+vWZej1ddNkeWhnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKVBxEeidJjZOVHbxrs3ky8u/f4YsPXqaDhEXKxPVjmkO3lJ/Y
	IRsSJ6blK5hYuUSV9V6WPyKeTiWEZUhNEwQmG8eBmaiFLsCOWQPGBd0f
X-Gm-Gg: AY/fxX6F1y2e0ysPWg5xuXO/hPiWV2DiDjWZ8jyEW4jBPcWd8DUIDmhi3VTmqcrg60k
	iGe9Oo1omFLwI17k3L7lBwtia4ktm6mFjNiC/I0BAY0Bmml1RE11s8WhoJv+qZNGGSvgEkvKX26
	ZJPJLFOeJIfqT08H5KKgRuEBOduo+GcyieM/46dUS40XrKFPd0Pv4Jzcj/8CBLQkGSw6Jh3TUuN
	v8VMwn3SLLweuM2FycS6n0DNL+9H0TbF4pGPyHe+Vuy9bmtxo5olsCmL9JANtqExYIiQSEsA9hr
	6mlGmwQCvYoqBAm2aLItS6WQH5NtHKUT6hfDJ+98mT3xuZGGATrWZpt2qjuTub3cr7iHbXdDQLy
	D3YURPQWCA0+v3a/0oBb4FDwH35aRT49Ih0I0HFWCN83ME3GU3TLJDp4elrY3931GN2WU8SarjL
	xg8QUgO233ma4fTZgS4vxHoi5jZm4jhKa0so5tZ4SyQCSJBKSg4wHk
X-Google-Smtp-Source: AGHT+IGR/bKrqbNOuJCrCZdXmkppZh3icvhkg4SbNmzPwMKi8ICKg/Fg2E3rNR/bgU4MfDn2mTBIIQ==
X-Received: by 2002:a17:907:97cf:b0:b7d:1cbb:5dfb with SMTP id a640c23a62f3a-b8036ecbd11mr890447966b.7.1766333717979;
        Sun, 21 Dec 2025 08:15:17 -0800 (PST)
Received: from [192.168.0.130] (84-148-177-143.ftth.glasoperator.nl. [143.177.148.84])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91599844sm7577559a12.25.2025.12.21.08.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 08:15:17 -0800 (PST)
Message-ID: <d25eb292-e019-4293-b389-d328b7b83b60@gmail.com>
Date: Sun, 21 Dec 2025 17:15:17 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
From: Jasper Korten <jja2000@gmail.com>
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
 <6dc26bf0-6e28-4478-9ec4-20622cc8a19e@gmail.com>
Content-Language: en-US
In-Reply-To: <6dc26bf0-6e28-4478-9ec4-20622cc8a19e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/12/2025 00:18, Jasper Korten wrote:
> On 09/12/2025 05:23, Aaron Kling wrote:
>
>> On Wed, Nov 5, 2025 at 3:28 PM Jasper Korten <jja2000@gmail.com> wrote:
>>> Hi all,
>>>
>>> On 11/4/25 19:12, Aaron Kling wrote:
>>>> On Tue, Nov 4, 2025 at 3:14 AM Thierry Reding 
>>>> <thierry.reding@gmail.com> wrote:
>>>>> On Mon, Nov 03, 2025 at 12:39:57PM -0600, Aaron Kling wrote:
>>>>>> On Mon, Nov 3, 2025 at 5:54 AM Thierry Reding 
>>>>>> <thierry.reding@gmail.com> wrote:
>>>>>>> On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4 
>>>>>>> Relay wrote:
>>>>>>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>>>>>>
>>>>>>>> Without the cmu, nvdisplay will display colors that are notably 
>>>>>>>> darker
>>>>>>>> than intended. The vendor bootloader and the downstream display 
>>>>>>>> driver
>>>>>>>> enable the cmu and sets a sRGB table. Loading that table here 
>>>>>>>> results in
>>>>>>>> the intended colors.
>>>>>>>>
>>>>>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/tegra/dc.h  |  13 +++
>>>>>>>>    drivers/gpu/drm/tegra/sor.c | 206 
>>>>>>>> ++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>>    2 files changed, 219 insertions(+)
>>>>>>> What does "darker than intended" mean? Who defines the 
>>>>>>> intention? How do
>>>>>>> we know what the intention is? What this patch ultimately seems 
>>>>>>> to be
>>>>>>> doing is define sRGB to be the default colorspace. Is that 
>>>>>>> always the
>>>>>>> right default choice? What if people want to specify a different
>>>>>>> colorspace?
>>>>>> I reported this issue almost a month ago. See kernel lore [0] and
>>>>>> freedesktop issue [1]. The pictures in the latter show what 
>>>>>> nvdisplay
>>>>>> looks like right now. It's nigh unusably dark. When booted into
>>>>>> Android with a tv launcher that has a black background, as is 
>>>>>> default
>>>>>> for LineageOS, it is really hard to read anything. Is it correct 
>>>>>> as a
>>>>>> default? Well, cboot hardcodes this, so... presumably? It would be
>>>>>> more ideal to expose this and csc to userspace, but I'm not sure if
>>>>>> drm has a standardized interface for that or if tegra would have to
>>>>>> make something vendor specific. I think that would be a separate
>>>>>> change concept compared to setting this default, though.
>>>>> The reason I'm asking is because I don't recall ever seeing "broken"
>>>>> colors like you do. So I suspect that this may also be related to 
>>>>> what
>>>>> display is connected, or the mode that we're setting.
>>> I have tried it on both a MacroSilicon HDMI capture card and an Arzopa
>>> Z1FC 1080p portable monitor and run into the same darker colors. Both
>>> have in common that they use HDMI which seems to line up with what 
>>> Aaron
>>> is reporting. I do not have an eDP display to test or another carrier
>>> board with a different display out to test.
>>>>> It could perhaps
>>>>> also be related to what infoframes we're sending and how these are
>>>>> supported/interpreted by the attached display.
>>>>>
>>>>> All of that is to say that maybe this looks broken on the particular
>>>>> setup that you have but may works fine on other setups. Changing the
>>>>> default may fix your setup and break others.
>>>> Do you have a device set up so you can check? Or does the regression
>>>> test bench have a display that can be forwarded?
>>>>
>>>> My current setup is a rack of units plugged via hdmi to a kvm which is
>>>> then plugged to a pikvm. I also observed this issue before I had this
>>>> setup, plugged directly to a 1080p monitor. I have not checked
>>>> displayport. I can cycle through a couple other displays without this
>>>> patch to see if I get any other result. I am fairly certain I have
>>>> consistently seen this issue since I started trying to work with
>>>> tegra-drm on kernel 6.1 or maybe even 5.15. I've never seen it work to
>>>> allow for a bisect.
>>>>
>>>> I am in contact with one other person with a tx2 devkit, who
>>>> replicated the issue when I asked. Who plans to reply to this thread
>>>> with setup info later.
>>> For reference, I am said person. I have a Jetson TX2 Devkit that uses
>>> the P2771 Device Tree. I'm running a Fedora distrokernel with no
>>> additional patches applied by myself. I have personally noticed the
>>> issue to at least be present on 6.14.5 and 6.17.4.
>>>
>>>
>>> I'm currently not at home to take screenshots with and without the
>>> submitted patch, but will be able to do it tomorrownight or friday.
>> Any further thoughts from the maintainers on this patch? As far as I
>> know, this is an issue for all users, at the very least on hdmi.
>>
>> Aaron
>
> I've finally captured some footage of the colors of my TX2 within tty.
> I've also added a reference in the form of my X13s doing the same 
> thing.[1]
>
> I will at a later date try the patch and update the MR comment,
> but at least this shows the difference while recording using the same 
> setup.
>
> Kindest regards,
>
> Jasper
>
> [1]: https://gitlab.freedesktop.org/drm/tegra/-/issues/8#note_3242611
>
As promised, I've added my test results to the Issue[1]. It seems to 
improve colors a lot more, haven't ran into any other issues.


The patch seems to work therefore:

Tested-by: Jasper Korten <jja2000@gmail.com>


Kindest regards,

Jasper Korten


[1]: https://gitlab.freedesktop.org/drm/tegra/-/issues/8#note_3246713

