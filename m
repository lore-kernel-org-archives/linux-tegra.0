Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB5F19B5B4;
	Thu,  6 Mar 2025 17:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741282649; cv=none; b=p6UZBTIzrhstxDs8+thq4ITu0HIDOHcN0WsT4qA/EZf+YqhTYV8sXtg1nBkAngIjxgSR3blrJrp/3TBqkigj+I7F9/aIJXx/gYqFWD3XlRVdgxFjXZiGsACAgeSuEunSVTETpbJZjvJh3sh2/z7zEJwr7Rdcg9/Q8XTxFbrPiqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741282649; c=relaxed/simple;
	bh=Uh5WoZ/+KDvafkHZGKE3HMdNVuvF4hQup8Vi4pC+zwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZ1MS9/mHKrKTUDR7Iv4eFdh8FcnOH0W8oXjep/X1fV0U9ObZd8eh9eLDKsCwkB/oASG2JyBIOuFISopUUjmzBa1HVPtF8PY6a2tPknZCVwbY0pE5K2Q2UGZukBHUj7doux7mZNJTx2MdvET1a+NlBIemVPkLSO17qTQAHXSi8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZO/s++ei; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZO/s++ei"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF3CC4CEE0;
	Thu,  6 Mar 2025 17:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741282648;
	bh=Uh5WoZ/+KDvafkHZGKE3HMdNVuvF4hQup8Vi4pC+zwQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZO/s++eiax4CbiGEErmnqf670Lts4lUgrYbO+4ifupjIHsxlJaKxvMGvXbUferZWY
	 i+VSmSlLo5Kst9K7ioVgRpIctLkvLj+fHgw6H+Q7HJ3xia+GPCZQ5sQNVfUoIxiCXW
	 amhubUNul2gD4S2J7GM+shjpqnVgXaquIpNgErYRSBNTTzpF3Lm3V+VC3epyMSsRMp
	 D1AjY2WvwwZg0WWfz1TrJUg7r8yxI/cY9h7TClCzu0RlGNjfpJTlCVtnCiNmXwCKNk
	 PRA4S+GD6/dQGiVVtaKnmq9W2cn06gb50A74DmdzaxQ8XehVLKp60E61fJhpOLombh
	 Lf530jXd1jI5A==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abf5358984bso151503766b.3;
        Thu, 06 Mar 2025 09:37:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+guMCSbcGRrZaJ526Yt8vVAbcxCe70atsGtPWY+9q9+6uCUhY+XFlqwl9jn4q24R6w/kFHSdWpo2F@vger.kernel.org, AJvYcCWdwbLuN9lozDFd4kk0pHVlF2gO4n4HWXBywhHEeBSU5a4QF4M7yoCjYqkMZdVCR7Qgek9lAY+B7Jra6Jw=@vger.kernel.org, AJvYcCWho9Jh+tQYEXax/YMQkxdWdUyKorF4kM+WVS/Cm71ua6UmdSSf/QV96DuJczXAvq6DSKbFBc0tHjFcPYbK@vger.kernel.org
X-Gm-Message-State: AOJu0YxPcK4uFsGBqpHI0EvzQo8sjAluN0wnPPVL8XdJmlH+A+hbNiT3
	AEX7kdzr5Gdq0J0TeLqvVelctxDxUW/jbmdnjOx9dY+O6cEgTgyRGa7NJVSApsOgNJl+JxKLa24
	dZ3FkpbdQAOQnNrTsqF86KoeKxA==
X-Google-Smtp-Source: AGHT+IFv/GsY2e7PYu/lH1gS0DWi7oxJtOeaIQ3tJ41RiGURBA1av82F0D/7rGiK056rWj/5F6ae4u6P5+9Bu7IuWXQ=
X-Received: by 2002:a17:906:6a27:b0:ac0:6e7d:cd0b with SMTP id
 a640c23a62f3a-ac20d951583mr867464666b.34.1741282647058; Thu, 06 Mar 2025
 09:37:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305224952.2995841-2-robh@kernel.org> <174128244841.2024061.11431672640522584852.b4-ty@nvidia.com>
In-Reply-To: <174128244841.2024061.11431672640522584852.b4-ty@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 6 Mar 2025 11:37:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJHFSteS8zZTDqvysaH5iqwcDELa+Vt-vWL+nW+jXmdFQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrxisKr7Gsk3atDD3dtOkh8vqfUsHWTCU7CsAbxUIk7FAomGTiWNcfv6a0
Message-ID: <CAL_JsqJHFSteS8zZTDqvysaH5iqwcDELa+Vt-vWL+nW+jXmdFQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] arm64: dts: nvidia: Remove unused and undocumented
 "regulator-ramp-delay-scale" property
To: Thierry Reding <thierry.reding@gmail.com>
Cc: soc@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 11:34=E2=80=AFAM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
>
> On Wed, 05 Mar 2025 16:49:52 -0600, Rob Herring (Arm) wrote:
> > Remove "regulator-ramp-delay-scale" property which is both unused in th=
e
> > kernel and undocumented. Most likely they are leftovers from downstream=
.
> >
> >
>
> Applied, thanks!
>
> [1/1] arm64: dts: nvidia: Remove unused and undocumented "regulator-ramp-=
delay-scale" property
>       commit: 90a1dc90d08bd1b8a324d4272d06d74525f51409

Arnd just applied it too...
