Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FE337F011
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 07:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772610197; cv=pass; b=ifzNSQL2zgQAg6eLE2F7SedJxQFRlmWBPta7qyWO4XtCg+tSEo4dxUAwDAgiFdzYqE48ozIRVZbQDHBbRBDoxejxFyzb8y4WTLhgeu8REi3VRW9x1B5RCng6yBtpb3RlyHOYVyAZ4nk3dNijijKe/IkoCj1rZKh6xFQZm/beoh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772610197; c=relaxed/simple;
	bh=rtntRDq4NKTpWNAYm4XDuk9dirDy3xAZZ59vCu4RFME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mDSAl7sk8mHjpYcKioxOnvLMKGudqi9RQV2VNOdZSGn9pKODj0F3x5cz/zB1N27mHXy3r9PE85f2Kj1sfR8Nh2dONQnUz9/2FgtytF/F1c3CFZmZfC70KgbKoGR3F/mH0NHGM7cnaS7e6J5Hz+VxQn8+PwwPN80L668mQl2cY90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tlp0RW1A; arc=pass smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tlp0RW1A"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-35448ca4689so757077a91.0
        for <linux-tegra@vger.kernel.org>; Tue, 03 Mar 2026 23:43:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772610196; cv=none;
        d=google.com; s=arc-20240605;
        b=Nq3kQnAIqbtK+EUiuBAApEDu3oWJqPpdX37xfg8V0ofMVSoiW7JAGc2GYZXCMRojR+
         ZPYWCkx4gARa0Up+F5Vqlr7txovg1gjj1yCzxpH6ea3bOKQulQt9GYBkid+6XvQGl+rX
         FfpQvgTFWywOH44Tl8r5Hq6WiBGkcphNM/Jsf4FtoiRhRqz+l0z4fPLJEVkvss2+LPmB
         HTqFBfvlyviYRSw2kAYPN0cmMjjPfA1y97lrLzmk0nz0nULGfzG+mV7mCmIbq5HrOX47
         42Zde3yjLbsrwcruCnKGj/dv9AjPgjhomCOpO7+4VuIwPJFOzAvYrIUeWAETwZZNWSH+
         15NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rtntRDq4NKTpWNAYm4XDuk9dirDy3xAZZ59vCu4RFME=;
        fh=rGgj1srZ26yn44lvrypAtkMbi4G+oIunjzIlXuxwxLY=;
        b=UiIpnh/zQMKVooCh85+cBPMs2iPGs7bdMCWidTEih7sIzjrug2TGNNy/vCkgMmtAM7
         JBm48HZ6Q0Kg1TreUtkN08lHeNsDEn3og80V+BEkF12B0KAQCTEmRlVK77t3cIGvJ0IV
         IrX/NMSdCGbDKzKHBn7SxaOLHY+C3CVEcd/AWfZjFIU+PeylDoMyg5Tmc6/Fs4IbOZDI
         ESC5JYNwxoIR4MS+Oj9Mar77A5JqTiP7w53mOKN2niTXombfaYNPh48gcS7ucaHYMUh6
         uWjCRoBv+TFzMy+4o5QgZr9cJB38YUjxVCSctQNU8YCPUCQ9F9JfDx22AU6ew/HmTGfv
         NomA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772610196; x=1773214996; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rtntRDq4NKTpWNAYm4XDuk9dirDy3xAZZ59vCu4RFME=;
        b=Tlp0RW1AYY/JticO4TKnhiHT5c9vLMjwL9w1mgBQLggpXhARRr3cw1t5uNvga8UnCj
         yTx7Lgj8oAi4Xbhjc2auun33fox1+tLoW3RyxFW0QqT8iMlsO9eXEwLnAsYKcQlM30wo
         GXtlSM1eSc0vB3LU/xYWwulVsAtGdHckzi5b7qPCp0IWUcNMt2IoFlL+uJhFeZa2F86h
         V7a1R1gqunnrHfHspwZVJ7Qi9utiEwd8vhJwRpTatqobdi3HXodP3cVHGbsSxyAmk09W
         o7Hm/9nmThKh2pSTU4DlCqrCHXKiyuRx/QX5C5c4H05cQ75xY6+uE/Z+ChSdPkODdvSP
         vVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772610196; x=1773214996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtntRDq4NKTpWNAYm4XDuk9dirDy3xAZZ59vCu4RFME=;
        b=lXIdqjxp1EZHe9CfwMdAGdCcASMHGCvMcpAaARh/vmTzf0z6beKTRtHSJWd7DMuy7m
         vIVsORSxXb1nADHMSTsvYPckfoWM3GWmAjOI6A/hFyqZZY9eM2P3dkdmUVlIftCxWiwg
         Ptf6klVa2AgVPKBmJi5b69YAPXjyBo9DFcm5T3eguIsOpwBMUJccZ6wyTn+QmmGPwpVx
         HoDph4m+Wbqd1xUQZcEcdVPmf54XndEkigs/BKMk6mV1XuNfCnvj3DkHadcTcKDY+7Fl
         zlCYC5zgcC92nsVxMbV9CD5PuZ/5JPMX8tjPtjyhLnuYrqF8KW+iwp+TLF0B4fu3iKtc
         YuIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJU7R/ilU0W4AwvvNC+dnJFroFXkKd+vBMfkZ8bwb0dZX3NrrwU7aGwf55BN2Oc7PQsnF2MGxJQSnBlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3CAMA63pcOSdtVP0LGCipB3XPXY/2epB0B+o196DVtvcTJMkc
	1vio94jmZmGlgyZAHf/ogKZYqN3HDTvJDhb12XKZ4hnDDPhzdDRDh2sXl4kpRFEJ6QtW60h8x2F
	FgduROP097FWvRVWfPAQwFhPBD59RLPTNqdUQsxkyoA==
X-Gm-Gg: ATEYQzzGW/FWuaFzS/A2dY4Pppd4DNEp9slaAuEXtpwXVC9DOvKW0l48MhUIgncnB+/
	hwRMvJjLNScFvpBBt/PqbXGR398VWBR9X6lkJ5x/Au1PQnkKZqkA6w5IS5JL9duwG/2DOw6WjV4
	CzIfZCcDulwyBkpnn7WmhzseiPSirhCixnUyv2fEXn3ijAvIzTbHv+ZLdlzbIzN2Dp4GfPzvN/y
	bMOTER3v1WBs9UtYLjxmIswIhxjI3XXiLdo6u0FfpfRcsjeIuXffovK8sUQDIHkpXTZHCsksDil
	FEBxSotYJ2WeT5oaxJmWuuQgWPaOkPDY8YFtoPRNAYXPxC6CeFBJEVQ12D3Qrb87FX8RXsENsKh
	ewj0pbWtBhD71gdZtpJH3iFk=
X-Received: by 2002:a17:90b:3a4d:b0:359:8e93:4fd6 with SMTP id
 98e67ed59e1d1-359a6a7bd40mr838957a91.4.1772610196217; Tue, 03 Mar 2026
 23:43:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228202008.40063-1-officialsohamkute@gmail.com> <aaVXtbHMfUFJW_Tu@stanley.mountain>
In-Reply-To: <aaVXtbHMfUFJW_Tu@stanley.mountain>
From: Soham Kute <officialsohamkute@gmail.com>
Date: Wed, 4 Mar 2026 13:13:05 +0530
X-Gm-Features: AaiRm52nF89l5pCedHQ757Fy73kr_WYmSkfZtqwFhuxnzI4f-qifOwfktduk5J4
Message-ID: <CAFxoRw0yZM8opXig2vgnFZR6mTPFgj0JFxKYx4vtv2VyqUWSJw@mail.gmail.com>
Subject: Re: [PATCH] staging: nvec: kbd: use -EINVAL instead of -1
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net, 
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thanks for pointing me to smatch. I built the DB and ran the queries.

From what I can see, dev->event() is called in input_handle_event()
but the return value is not propagated back up. The smatch caller_info
table shows type INTERNAL for that call which I understand means the
return value stays internal and never reaches the caller of
input_event().

So yes, this patch has no runtime effect. The reason I sent it was
that pcspkr.c uses -EINVAL in the same type of event callback, so I
thought nvec_kbd should be consistent with that.

Also noticed atkbd.c has the same -1 in its event callback. Should I
send a fix for that too?

Best regards,
Soham
