Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443BE376BD9
	for <linux-tegra@vger.kernel.org>; Tue,  8 Sep 2026 06:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848055; cv=pass; b=TED6he18RTp6k188YNFo4hkGXWM4lKzW05x2wW94vJU7+qPU0uAKlWKDittQruGXlG1nMddOeHDWocVgSIytg5c1Nm2ArQ5CfJ9Gjia7ZzNtWt9B2R5cqmZKuKifMt59jJVMxtuWz8hSxPCCI6338YoAmaqI9zbHRA2lL4qFfyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848055; c=relaxed/simple;
	bh=nz/E8Was5D7JaqEncwfea5RvOUqnJVsIagSdBR7u0SY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=uhdBe9qFZAtiJ1JNa+tZ/F+pSC8hYo48inlX9k0fwHaesJQXM1K0cQVnurHHw3oTkMCAL9WrRDfPMoaH1lGgY0wdgn2X69fOmM40TAcQZ9p2TF/pfXFxQ8dzzdqweKJMnDxA3Tv723pSA5UNZku7NWNjNGyr8qoMG9wDWusRpN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EB+lbCgd; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EB+lbCgd"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c20e70a0962so527258466b.2
        for <linux-tegra@vger.kernel.org>; Mon, 07 Sep 2026 23:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788848052; cv=none;
        d=google.com; s=arc-20260327;
        b=ZizHUyaGQCb3MpFEBoVasck3XM2n03a2FExmD3cno6QvWQA/FTEK1kfTqsbXxrwyY3
         RYRGhg6STvJOMJn9wQobRFV2J5X5fERKYeba/3wBf8Xvwym5mUBnEY5IEDuCOELHrgap
         0S+h5W1dmhBpznaiCDrQUUvSRyZ4DK8gyLJMuQLQA7iIp1R+rQIt24lN6+7jY9VQstFW
         uEKEeLXooljO2sJF+Aff2bsZ1Um3PNkZiagTUsEf70H+UZYufkYL5w3+z1UxciCwAEPc
         NJMvXxzk/va1LUoHgFkMg4gW/jLlOWLH3Nzc61RAWwmxexQIgWht+mf83ACRpu1NyhAG
         uKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=nz/E8Was5D7JaqEncwfea5RvOUqnJVsIagSdBR7u0SY=;
        fh=pUEUUv1VTqhwM4y3eueltqvpvfB/sOusX1tOcFR0riM=;
        b=nCI2MqTlMiAjdlPYIW64ulXIsyTlD8ypDbqu9ozju9PA+QiVCwNjNBV2kriu6uLFUG
         RhyRM2nLeuWJPD3C7AUdhScgK7WzqKwd6IpIqCZ6E9KU7PtvQLIACMkWoWI2inelUE2F
         5EdugH1uXqtGmJ6z2I2CuTfJtA06kw3tcgYDTzv70OWegkqeOnzWXMfY6Vo21/g1h0hp
         h3YU+ImQDUsUfaQHdQkxhOnd9kQYYArVvOVXR8aHpip4aJ8OO9ktvgbX1R2Y5LCJrF6X
         QZ2ryYZ6JRJJqdSqCGMzArGJaP6FCz3rxFu0yjetLUtOTHytY8KOghOVzUndk6OIY8Hv
         Bpjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788848052; x=1789452852; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nz/E8Was5D7JaqEncwfea5RvOUqnJVsIagSdBR7u0SY=;
        b=EB+lbCgdVcAfs9abwLFh8DpilVL+Z04pKLP8zLeuSCEmdWRqHTxhpYp2MmB72CtEIv
         e0iBlNhV59KtbsPdwDYyznzFzhS6SFV3IjhSX6YplFJvHAVaBA4Y4FLqz3lObmrqlF2G
         6bMMdF+dY6EPq1IMHVVaAW4KnM9extKtdgtDrBWzgOSEKDquP5tGu7fxu1z49NYMpocJ
         ESlWxBbxJ8JaKlBonM07QXwq770xajySWZlK0CgWUbSUL6zFjJVjtzOzwoVFX2Gh0Cz2
         DKWr5DnQ1u9qrdQk+ILsVOVk7bFBDBmyLcw7p8Cv6T34p7bsS5/Nx/w4HOfR6zwTiaDB
         9k8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848052; x=1789452852;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nz/E8Was5D7JaqEncwfea5RvOUqnJVsIagSdBR7u0SY=;
        b=WblOw/YwDFG4IPs0EmsaBqRCB3VA3ZYkN04HWlDF5dkifzj64CUyurBJzHgzM/TCBq
         o4Tkxq+1x85HxCCzvnJihYLK5oJEVdbF/jOIJv/p+uwi8s2FjHQPdOCvP5Z5r/lECPLR
         SIfqrQ04+0sI3vHEDnqQx89kqTAcIpWvaY2g893RBF73+1MJG8D3+GCIY0T0H3ckgxr2
         cv7DqCOeYytC83O8ymRxAe8Q4naY2gI/PfVRffONuFKzT/zS+7B+ArVQJwvOG/4XapK+
         6v3okJg8w+aA88gLqVrrC7lThxNuFYReIJnJy1MGUY8mb1mqskLoQ4vJxXQbZky84FwS
         dd7Q==
X-Gm-Message-State: AFuF++l+QDK0XsA0hPgOgtHbMu1Z8UrPUWU3ltH9JNUxs7asb8OIBbeR
	EbKQW+SaeEO0Ze710a2fzYiYel4dGEwKtng/cvumk2sRYzbKmltzhnmikuPgwL4Cs6F9aGVP49K
	XZYLqxlt/s9Il9m4ajNqV+m+zwbP3S+5ttNer
X-Gm-Gg: AYBFou0HQq+mqyy7PzZa/9LR0Gew6NTFM3KLfJ9V/p1dWWcQjs+XX7FnLP1v3WmfR8j
	fLaiJ/x96Ktc1Qqxiy3z+OkCZt6PMnkvSshqC0rlrDnGZL4R6ZXn44TYbVzUeKTOiMp7IgaictE
	2S4ibQXsL89xD51X4OSmV6a1y1hQYN8cbmgeGbXqvXrRX+gHwc+GF+s0SGot+3ZYl5K21HHr6pa
	heoEZQONK3+Te1CFUtUv9ZjRFAJq/Pcbb0LR2DyfT5y9lIK8oVQpV6bfHupM2gcwj7I4bnlta/B
	4GpbSW2Y9tg0wae1fiUBBe0/kBdtUFrCBSSeZBqeHIeMY70=
X-Received: by 2002:a17:906:7308:b0:c20:9447:bd5e with SMTP id
 a640c23a62f3a-c260c8e77fcmr2174932066b.9.1788848052298; Mon, 07 Sep 2026
 23:14:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1788847939-25860-mlmmj-7b349761@vger.kernel.org>
In-Reply-To: <1788847939-25860-mlmmj-7b349761@vger.kernel.org>
From: Pintu Kumar Agarwal <pintu.ping@gmail.com>
Date: Tue, 8 Sep 2026 11:43:59 +0530
X-Gm-Features: AcwNN1Xoy0ai-IaWGf55wvp4LtcjJ9Aojfg5PdjrlftyCOBb_MKz9mYV_ghx9XE
Message-ID: <CAOuPNLjW0tr_bW3_YbGheoPaEA8gCS9o4Sy6K9YDThCgrqNOig@mail.gmail.com>
Subject: unsubscribe
To: linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

unsubscribe

On Tue, 8 Sept 2026 at 11:42, <linux-tegra+owner@vger.kernel.org> wrote:
>
> Greetings!
>
> This is the mlmmj program managing the <linux-tegra@vger.kernel.org>
> mailing list.
>
> Your message to <linux-tegra@vger.kernel.org> was not delivered to the list
> because it contained a HTML part. Only text/plain messages are allowed on
> this list.
>
> Please configure your mail client to only send plain text mail.
>
> For your reference, the rejected message follows below.
>
>
>
> ---------- Forwarded message ----------
> From: Pintu Kumar Agarwal <pintu.ping@gmail.com>
> To: linux-tegra@vger.kernel.org
> Cc:
> Bcc:
> Date: Tue, 8 Sep 2026 11:42:01 +0530
> Subject: unsubscribe
> unsubscribe
>
> On Sat, 5 Sept 2026 at 03:38, <linux-tegra+owner@vger.kernel.org> wrote:
>>
>> Greetings!
>>
>> This is the mlmmj program managing the <linux-tegra@vger.kernel.org>
>> mailing list.
>>
>> Your mail host rejected some of the messages we tried to deliver.
>> This usually happens if we have accepted a spam message, but your mail
>> server refused to take it from us (because it's spam).
>>
>> This automated probe is just a test to make sure that there are no other
>> problems with mail delivery to your account. No action is required on
>> your part -- if you are seeing this message, that means everything is
>> normal.
>>
>> (In fact, you can add "Subject: Bounce probe" to your filters to avoid
>> seeing this message in the future.)
>>
>> For internal tracking purposes, here is the list of bounced messages:
>> - 17132
>> - 17134
>>
