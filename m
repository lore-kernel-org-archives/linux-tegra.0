Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795400923;
	b=AKVXf1EJMwwaMdr5LKvc2JV6Q6jo/zzufUi44ZHpLlnJvevLXvfUesJ4IyDbWuPSr7aS
	 ss9Zo8izjsk0V4Nvw2GwAzlVep/NuS1CEWaH4gK635/O0wABH//KaP+BFXJjGrC6yBDf7
	 odrgcWCrsVU47imQxjYiZTRvAmo3hZAVs11Z7M8zcaPacOnWXQkMqRuDrtg1S/1VDtp+c
	 JAsRVsKMCcxiZ687Yuu4/3Lext8atME9mDUeMMCNxOOtlvdNhSalMUkQZn1Iou6LEu9Sk
	 zplwIyOfOUzfVOMEaDR2BADotjg/JtkDP1kSeqXhbD+TZKkrFkyNEjLbDdoVIlNWHLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZicVV9Z+dbEcvbsxd5GYeloidM7KPsn1mE2hWsjYDlc=;
	b=du3rwpP/c3vGOdTVpm9O+fjwJ2BQsWe2qm37GLzxujhRL+xsxp3n3AKhSwKK7+aywt1c
	 Ax+rs4Y4JxSausPHeZ++hqF4wMo6ocfo74SPuLYtHeKjKoONUONYOTII9LmrErQHoO1H3
	 ivfCAS1KPRXM6IKrViVRBo5IIEPhh+0Zsr+uDa+MuJXnvAIp+KX/CGWG8LEnUE8MX2keu
	 yv3LyzqJ8cB48oakc+rov6ozzDHHkAHVFZfI09dZXkqwhvrHSnZhiX2E6O/Dgc25ZWQ1R
	 l/4zoX40UvahUZldNLA45y3dETwyc2i7de4+DaSSkFDwwA3uQmmnl8gL3E3B5NDYgsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y1VNUVr6;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CE2606A31A
	for <linux-tegra@vger.kernel.org>; Mon, 23 Nov 2026 02:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01CE2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y1VNUVr6
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386ab9ab619so1295773eec.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 18:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400922; x=1796005722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZicVV9Z+dbEcvbsxd5GYeloidM7KPsn1mE2hWsjYDlc=;
        b=Y1VNUVr6cZxi6mv7oTelykzw32dhCaT4Nul0xpjhZF7276mJ/5rBfU4HjZLSZJNZnm
         6WsiDlMKLMEVujePFH/6AV0cZBl/X5lfHq+cuEyCqFV5SSFKB01dB0XsQQiX4JDcRNYp
         fm7XfDsnwCg9V+3oxAS1lO7Fj6H3kjrLMjasNU+sXhn4brbP/NTN+Wsp3hNdgFZh37GZ
         7ARLvJrrxe+fGrGiMFUPsLg9H3FiBeILJ7kd0tAfQOl/fco+GX71C5jwPDtte1AzDICh
         7vKDo5yfpywIj4czLxiqwgSqj9N79h92h0707pQeVEzlhaUC/9W9T2aiRd20L18DcmlL
         5XhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400922; x=1796005722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZicVV9Z+dbEcvbsxd5GYeloidM7KPsn1mE2hWsjYDlc=;
        b=MD51SQi19qXKqt4LLjZfc9wC9rC11w/gAe7cVsqmQosI8z/TvTG7tlrJAwr/u9bpsU
         1GtFARpB+MwmvDLCD6fMHSR7ZrJ+PrA7M1m2xkpL39dzN3ovrAJomcYs0hMb/FcMixtd
         3HFk7cc0Ynq+y0ovC1Oek2yWW6MslKVxg/yDb0M6s3qk4rH7Ije9/he7Bia4H9NyqyQJ
         7ji9PLpHjPbK5Bcuirn8n+7z4NuJ50ed4Tnz0enwaQOfXnum7Bh2LNw/sQs5wmQJG1k3
         jcfiE4hwdOFGOHoXpTuSdxPzl1oT5qpSoX5J1mM/eLyrALmeATaUuF2ZQ1RKfLKvO0yF
         MYGA==
X-Forwarded-Encrypted: i=1; AL+hErHZVcqW+sClkIokTKNbTg+metoJXGQhHalnbY0GhjpFJcqiYkGmOIUYlXJ9q9efbvp4y9GyL9IWUcul+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8c8yk7RZNBkudRNtocoS81unPegk1humFGaFhlLy9N828gXXeZ
	sGP0pacxfz5kDnHK0lRi/pznsqsnvHcE5TWiBkg/8SN8Hg2jRLBwpA1T
X-Gm-Gg: AZFdTZeNcFp/2ABGJID6SDOA/TR4Bh3EO+WMc7P/IkdNT/12IyAYr64jaZP+ZHXa58z
	8QFkz2QSlU5Q7JlUpuG0YJMEGMuB6f4t/07U7n+p8QDOlzmhLekgx0PmKoiulGk0MpFWTLPSCAD
	jDBmSPGpIuVMkR3oHUS7QT5SRemqT/0hewnG/a8L/0Gsn7YeViQs3xCt2kyzkziZDKFyCtmREWQ
	dW7W41neiScGPKfBNbKuuTeVmpJ4dj3Fodd3+6zbKfOFO9pUgWVCk8WCnyZf9i6S7zAjPl+FfXT
	uYSmKI9FXggbRjRjTL1ED0aQmOvdn1C7ML466xXTCkNGREVl0MVRa9lMURvF+wc1SB6eFoCo8ZB
	sc5BU9yt6RlUvZ/bvSKq1PGHiFlM1u+riaEzI1n/jvaLa9T7GsOFAY4DsY1TwulRAJP8yrGC0he
	tbLoHbLuSoJK5m10Upa+6j6iOc+AdkP2VBp5NSrZEDxm6+u/KUGfP4EZ3bCqnHs4LcJ7RguqVH9
	knNJj85pQGMtKOxCKIb1+EeYb5Cj+jF6XDre3dn+Bn2l+8OQbYDCFBKYyyyQmjCZUKMyPeII4yt
	21Mr87ULVBgEUnkrPCNwlms1Wgu1Q94uUYGZuc+2A8wbEYrC0wyTTRzCHIUbtm0QOm2sVXU=
X-Received: by 2002:a05:7300:50c4:b0:386:121c:c275 with SMTP id 5a478bee46e88-386121cc3c8mr9558886eec.10.1795400922103;
        Sun, 22 Nov 2026 18:28:42 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm28632639eec.16.2026.11.22.18.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:28:41 -0800 (PST)
Date: Sun, 22 Nov 2026 18:28:38 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Geert Uytterhoeven <geert@kernel.org>
Cc: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>, Lee Jones <lee@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, mfd@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 3/4] input: serio: Enable compile-testing for
 SERIO_ASUS_TRANSFORMER_EC
Message-ID: <awOk0yzFfiGt1kro@google.com>
References: <cover.1795355432.git.geert+renesas@glider.be>
 <234c01e4ac98bf72e3e2bbfa7b4fba635530ab8c.1795355432.git.geert+renesas@glider.be>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <234c01e4ac98bf72e3e2bbfa7b4fba635530ab8c.1795355432.git.geert+renesas@glider.be>

On Sun, Nov 22, 2026 at 02:56:32PM +0100, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> The Asus Transformer's Dock keyboard and touchpad controller driver
> builds fine when MFD_ASUS_TRANSFORMER_EC is not enabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thank you.

-- 
Dmitry
