Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3475F31B10F
	for <linux-tegra@vger.kernel.org>; Wed, 21 Jan 2026 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015315; cv=none; b=Kl6rsbiyPt68JmGZ7EAeTzvQkSQ8RyrjZlcH0rsRi2MAigdwy0ZjnjmkRe1SOelqQP0OtS5+KBMyzgzm9hO88hNgYU/XFJSXP3N9B9jfWc6MjZMaMHDafIzDIjNh0hh1ZL0z4J6fJ7by8puSmd/LulGgA0eJ7bzdzKo1zgI8u2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015315; c=relaxed/simple;
	bh=ylt8hCn+PfJWRmyhebzDTVE9RwwtBWImeihh+sFkkuU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Dze8knUk1e1jup6YLUrdMP/Aow5mrqNR6RWm4GHYgSj1sD73fgQo4BdTtZIdkOwr1xUW1DkKE6jNDm+h+cr8NMCWrYSb3G7n0/LKKk9hKX7ZDnexqaqePqx3Liy/hnCBvVtRpb6IMh65LJOW7oUUevXKDHdqbMpdEbtbd1UVSKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+n/GTfV; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+n/GTfV"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-3f9ebb269c3so47802fac.3
        for <linux-tegra@vger.kernel.org>; Wed, 21 Jan 2026 09:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769015312; x=1769620112; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=af5XQHYCmWbE8OkeX4m6uk9+GAFVqnxcLOlrwMZ+INI=;
        b=h+n/GTfVDfC0BnQKeAs3UcEYynhRK2NmF92CFepuqe/EW762IF9ihms4X7s4PjWISW
         tqODo4WmOO5ngorVxINd+p3Ly4lvjBwpOrLVcIx58ywM8sq2vZPx7v3l5pbQTKQF4NgQ
         E+gBMP4+ZdwEgL+trKcQs2hEZl9Xjo1dQOaycaLMpLOI0wRGpygbIKDrIx8xKvIUYcZW
         za2g7LwYCRrh5GfpwvK665H41teWxsz5AhTiU5KMSdJ14c9TeRebCbq5DzpVzOXo/qHJ
         5lK4PGarvyAJx+kHl41PbILCgodlFbicUKTICITOpQHdfqac0dV16JdPgwk8lTxO44KY
         aNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769015312; x=1769620112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=af5XQHYCmWbE8OkeX4m6uk9+GAFVqnxcLOlrwMZ+INI=;
        b=So3g3NpyLIgR1sO84hJj2U6+UcLmCco5tfsKGqEeSUj6b81j4FPN4AAQFF2LgW98ay
         YGS6/CY2fotVPjx0IJm9BP+NVowSDU1JrGAilUR+QS+qa/w2zNyIX8AIzbNLD/LrKFPs
         KFl8emyoJ1vE2C4fZM0lMIwhNDkMGMu/7fo7FN2pORSitOGnHXhrXNfiT9vzptao2TbS
         6kIvCnFcz6itRQr0dr6MkeP7+xp8i4Tfa04L79fpD005mlvRq4PJD/e38waBWu9xt6EG
         jacVf4WA3vG4tEUmVKutH00zIey0EJKOdVkXQxGH8AglRihIHhyzFj9AH5StJ10udhLv
         He6A==
X-Forwarded-Encrypted: i=1; AJvYcCWF2xzA2pislBHWw0bzQCseg85V0u3T0uTgyHuMmWZpvEHGMDKxxmkM8DfSwG8edBWHTaxt2Dr7rEVK8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgevAjXmheu9lmYE4jaxHgcT+Vg0RuIVnpsfmH5RoQOAw6YJep
	dYiIrrhPNJ9LNLElMP/lvspfh6G0RKpvHSVS8cw9m+aD9puuymAlU/Wy
X-Gm-Gg: AZuq6aJF0IWp1Zh58UAFbpxTz7CxkpIWfiz5U+HTBw91EEGgFmpH/e3jE8Zmxf8ofJQ
	/Oh/6SGYBZpqMe1aGV0QjYdpLajBYUOS0/oGJGSyk3kzz80Tj+xLGm3MfxOJIXVNwzRUKfnS5Bs
	obGiVksLL3rXmo4LkRkLLCMce04gsELWrj7cFopJafAvZ/ShX6xUeIlryG6pd4Qk0hlcz/nzfdS
	2K5ENj1WUaewlfPYZLHLN6vmDZFdGeyoE96jkjK7jRVB7x5vIH006JUJN0Jb7xOjtRBiU7e8QWo
	6Cswj+lFVvDBjePgzjuuXrMxX6B+SsVDPPHQD4z/qJfXaRFWL+Bb8Uw2/1RCs5+G/U/6GTbQNpR
	IvY9zbm1NRSh2vhbEx0SXgyKSnr3hVBMjiCAb+HHXLJPDZnaAzDxc+rZkQDnmtm0gWKR6xmn+3B
	9VtvE72XvR/3DzRV5pe1+jBscMRgc0T9Edf21ahJkWSCDtyQsVxfiPm2M=
X-Received: by 2002:a05:6820:480f:b0:65f:69f7:d0e4 with SMTP id 006d021491bc7-66117a3d381mr6187186eaf.83.1769015311981;
        Wed, 21 Jan 2026 09:08:31 -0800 (PST)
Received: from smtpclient.apple ([207.154.79.109])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-661187840d8sm8111739eaf.12.2026.01.21.09.08.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jan 2026 09:08:31 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
From: Kurt Kiefer <kekiefer@gmail.com>
In-Reply-To: <CALHNRZ9b98Su9qAqXRSTCStoUPtC_u3+MG0cr4SQ-g3aVJD7LQ@mail.gmail.com>
Date: Wed, 21 Jan 2026 09:08:19 -0800
Cc: Jasper Korten <jja2000@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8615742F-EE35-4B37-BA0A-D62FFD5424B4@gmail.com>
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
 <pedxgtvzfrfzihoshhfvntin3hwwi3znleilbz4abjad74nowb@un33lgiaa26z>
 <CALHNRZ9-XrMUkQE0cwjq-HUYsy5uerhOQ9sNpirp23kKoaPuYw@mail.gmail.com>
 <72llskwvuwyllvz24zoex4ad6v6t5skiehmwylj7exoh7bmzjo@xq3v7vja5w62>
 <CALHNRZ_k6e9ZRmpK6Pzpet=RzUQ0fRYmfnea6U+9E2oZc8=z7w@mail.gmail.com>
 <eac10a43-5164-4ecf-8b56-6099e69001bc@gmail.com>
 <CALHNRZ9b98Su9qAqXRSTCStoUPtC_u3+MG0cr4SQ-g3aVJD7LQ@mail.gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)



> On Dec 8, 2025, at 8:23=E2=80=AFPM, Aaron Kling =
<webgeek1234@gmail.com> wrote:
>=20
> On Wed, Nov 5, 2025 at 3:28=E2=80=AFPM Jasper Korten =
<jja2000@gmail.com> wrote:
>>=20
>> Hi all,
>>=20
>> On 11/4/25 19:12, Aaron Kling wrote:
>>> On Tue, Nov 4, 2025 at 3:14=E2=80=AFAM Thierry Reding =
<thierry.reding@gmail.com> wrote:
>>>> On Mon, Nov 03, 2025 at 12:39:57PM -0600, Aaron Kling wrote:
>>>>> On Mon, Nov 3, 2025 at 5:54=E2=80=AFAM Thierry Reding =
<thierry.reding@gmail.com> wrote:
>>>>>> On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4 =
Relay wrote:
>>>>>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>>>>>=20
>>>>>>> Without the cmu, nvdisplay will display colors that are notably =
darker
>>>>>>> than intended. The vendor bootloader and the downstream display =
driver
>>>>>>> enable the cmu and sets a sRGB table. Loading that table here =
results in
>>>>>>> the intended colors.
>>>>>>>=20
>>>>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/tegra/dc.h  |  13 +++
>>>>>>>  drivers/gpu/drm/tegra/sor.c | 206 =
++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>  2 files changed, 219 insertions(+)
>>>>>> What does "darker than intended" mean? Who defines the intention? =
How do
>>>>>> we know what the intention is? What this patch ultimately seems =
to be
>>>>>> doing is define sRGB to be the default colorspace. Is that always =
the
>>>>>> right default choice? What if people want to specify a different
>>>>>> colorspace?
>>>>> I reported this issue almost a month ago. See kernel lore [0] and
>>>>> freedesktop issue [1]. The pictures in the latter show what =
nvdisplay
>>>>> looks like right now. It's nigh unusably dark. When booted into
>>>>> Android with a tv launcher that has a black background, as is =
default
>>>>> for LineageOS, it is really hard to read anything. Is it correct =
as a
>>>>> default? Well, cboot hardcodes this, so... presumably? It would be
>>>>> more ideal to expose this and csc to userspace, but I'm not sure =
if
>>>>> drm has a standardized interface for that or if tegra would have =
to
>>>>> make something vendor specific. I think that would be a separate
>>>>> change concept compared to setting this default, though.
>>>> The reason I'm asking is because I don't recall ever seeing =
"broken"
>>>> colors like you do. So I suspect that this may also be related to =
what
>>>> display is connected, or the mode that we're setting.
>> I have tried it on both a MacroSilicon HDMI capture card and an =
Arzopa
>> Z1FC 1080p portable monitor and run into the same darker colors. Both
>> have in common that they use HDMI which seems to line up with what =
Aaron
>> is reporting. I do not have an eDP display to test or another carrier
>> board with a different display out to test.
>>>> It could perhaps
>>>> also be related to what infoframes we're sending and how these are
>>>> supported/interpreted by the attached display.
>>>>=20
>>>> All of that is to say that maybe this looks broken on the =
particular
>>>> setup that you have but may works fine on other setups. Changing =
the
>>>> default may fix your setup and break others.
>>> Do you have a device set up so you can check? Or does the regression
>>> test bench have a display that can be forwarded?
>>>=20
>>> My current setup is a rack of units plugged via hdmi to a kvm which =
is
>>> then plugged to a pikvm. I also observed this issue before I had =
this
>>> setup, plugged directly to a 1080p monitor. I have not checked
>>> displayport. I can cycle through a couple other displays without =
this
>>> patch to see if I get any other result. I am fairly certain I have
>>> consistently seen this issue since I started trying to work with
>>> tegra-drm on kernel 6.1 or maybe even 5.15. I've never seen it work =
to
>>> allow for a bisect.
>>>=20
>>> I am in contact with one other person with a tx2 devkit, who
>>> replicated the issue when I asked. Who plans to reply to this thread
>>> with setup info later.
>>=20
>> For reference, I am said person. I have a Jetson TX2 Devkit that uses
>> the P2771 Device Tree. I'm running a Fedora distrokernel with no
>> additional patches applied by myself. I have personally noticed the
>> issue to at least be present on 6.14.5 and 6.17.4.
>>=20
>>=20
>> I'm currently not at home to take screenshots with and without the
>> submitted patch, but will be able to do it tomorrownight or friday.
>=20
> Any further thoughts from the maintainers on this patch? As far as I
> know, this is an issue for all users, at the very least on hdmi.
>=20
> Aaron
>=20

I can confirm that I have the same issue on a DisplayPort output of =
t194.
IMO, this patch will need to be reworked a bit to enable the CMU for =
this
output as well. I hacked this change in for DisplayPort, and then it
functioned as intended there as well.

I've traced back to the reason this is necessary. The DC hub driver is
applying an sRGB degamma for every RGB plane (presumably for blending),
and then nothing reapplies the EOTF later on. Without gamma correction
in places where it is expected, images are going to look "too dark".

Which does raise the point that there is an alternative implementation
where we do not degamma RGB planes in the first place. But this may have
unintended consequences when it comes to composition.

The SOR does not appear to handle YCbCr outputs at this time, so =
enabling
the CMU assuming an sRGB EOTF seems like a reasonable path here, to me.

Kurt=
