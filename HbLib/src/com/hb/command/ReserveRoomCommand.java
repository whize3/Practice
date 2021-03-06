package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.StudyroomDAO;
import com.hb.mybatis.Studyroom_ReserveVO;

public class ReserveRoomCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Studyroom_ReserveVO rvo = new Studyroom_ReserveVO();
		rvo.setId(request.getParameter("id"));
		rvo.setS_num(request.getParameter("roomNum"));
		rvo.setSr_date(request.getParameter("rDate"));
		rvo.setStart_time(request.getParameter("start"));
		rvo.setEnd_time(request.getParameter("end"));
		rvo.setSr_state("1");
		
		StudyroomDAO sdao = new StudyroomDAO();
		sdao.roomReserve(rvo);
		request.setAttribute("rvo", rvo);
		return "Controller?type=strSuc";
	}
}
